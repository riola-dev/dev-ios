//
//  ViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - property

    /// 채팅 세션을 위한 메시지 히스토리
    private var chatHistory: Array<Dictionary<String, String>> = [["role": "system",
                                                                 "content": StringLiteral.systemPrompt]]
    
    // MARK: - view
    
    private let field = {
        $0.placeholder = "Type here..."
        $0.backgroundColor = .gray
        $0.returnKeyType = .done
        return $0
    }(UITextField())
    
    private let table = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView())
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.setupLayout()
        
        field.delegate = self
        table.delegate = self
        table.dataSource = self
    
        startChatSession()
    }
    
    // MARK: - method
    
    private func attribute() {
        self.view.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.view.addSubview(field)
        self.field.constraint(.heightAnchor, constant: 50)
        self.field.constraint(leading: view.safeAreaLayoutGuide.leadingAnchor,
                         bottom: view.keyboardLayoutGuide.topAnchor,
                         trailing: view.safeAreaLayoutGuide.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        
        self.view.addSubview(table)
        self.table.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: self.field.topAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    
}

//MARK: - Text Field

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            continueChatSession(userMessage: text)
        }
        return true
    }
}


//MARK: - Table View

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "인터뷰를 시작합니다. 답변에 시간이 소요됩니다. 답변을 입력한 후 기다려주세요."
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        cell.textLabel?.text = chatHistory[indexPath.row]["content"]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

//MARK: - handle messages

extension ViewController {
    private func sendMessageToChatGPT() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "chatgptKey") as? String else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
        let parameters: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": chatHistory
        ]
        
        AF.request(URLLiteral.chatGPTURL,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let choices = json["choices"] as? [[String: Any]], let firstChoice = choices.first, let botResponse = firstChoice["message"] as? [String: Any], let content = botResponse["content"] as? String {
                    self.displayBotResponse(content: content)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /// 채팅 세션 시작 함수
    private func startChatSession() {
        sendMessageToChatGPT()
    }
    
    /// 채팅 세션 진행 함수
    private func continueChatSession(userMessage: String) {
        let message: [String : String] = ["role": "user", "content": userMessage]
        chatHistory.append(message)
        sendMessageToChatGPT()
    }
    
    /// 봇의 응답을 화면에 표시하는 함수
    private func displayBotResponse(content: String) {
        let response: [String : String] = ["role": "assistant", "content": content]
        chatHistory.append(response)
        
        DispatchQueue.main.async {
            self.table.reloadData()
            self.field.text = nil
        }
        
        if chatHistory.count % 4 == 0 {
            continueChatSession(userMessage: "다음 질문 해주세요.")
        }
    }
    
}
