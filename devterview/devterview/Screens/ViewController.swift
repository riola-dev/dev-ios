//
//  ViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - property

    /// 채팅 세션을 위한 메시지 히스토리
    private var chatHistory: Array<Dictionary<String, String>> = [["role": "system",
                                                                 "content": StringLiteral.systemPrompt]]
    
    // MARK: - view
    
    private let field = {
        $0.placeholder = "Type here..."
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        $0.returnKeyType = .done
        return $0
    }(UITextField())
    
    private let table = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView())
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
        field.delegate = self
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - method
    
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
        cell.textLabel?.text = chatHistory[indexPath.row]["content"]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}