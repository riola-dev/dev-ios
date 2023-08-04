//
//  ChatGPTNetworkManager.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/03.
//

import UIKit
import Alamofire

final class ChatGPTNetworkManager {
    
    static let shared = ChatGPTNetworkManager()
    
    func postChatMesseage(completion: @escaping () -> Void = {}) {
        
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
                    self.addBotResponse(content: content)
                    completion()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /// 채팅 세션 시작 함수
    func startChatSession() {
        let prompt: [String : String] = ["role": "system", "content": StringLiteral.systemPrompt]
        chatHistory.append(prompt)
        postChatMesseage()
    }
    
    /// 채팅 세션 진행 함수
    func continueChatSession(userMessage: String) {
        let message: [String : String] = ["role": "user", "content": userMessage]
        chatHistory.append(message)
        postChatMesseage()
    }
    
}

extension ChatGPTNetworkManager {
    
    /// 봇의 응답을 추가하는 함수
    private func addBotResponse(content: String) {
        print(chatHistory)
        checkResponse(content: content)
        print(chatHistory)
        if chatHistory.count % 4 == 0 {
            continueChatSession(userMessage: "다음 질문을 해주세요.")
        }
    }
    
    /// 봇의 응답이 양식과 맞는지 체크하는 함수
    private func checkResponse(content: String) {
        
        // ChatGPT가 양식과 맞지 않는 질문을 하는 경우 임의로 넣을 질문
        var text: String = StringLiteral.questions.randomElement() ?? "퀵소트(Quick Sort)의 작동 원리를 설명해보세요."
        
        if content.contains("질문") && !content.contains("답변") {               // 제대로 된 질문
            text = content.replacingOccurrences(of: "질문", with: "")
            text = text.replacingOccurrences(of: ": ", with: "")
            text = text.replacingOccurrences(of: "\n", with: "")
            let response: [String : String] = ["role": "assistant", "content": text]
            chatHistory.append(response)
        } else if content.contains("점수") {                                        // 평가
            let response: [String : String] = ["role": "assistant", "content": content]
            chatHistory.append(response)
        } else {                                                                    // 양식에 맞지 않는 응답
            let response: [String : String] = ["role": "assistant", "content": text]
            chatHistory.append(response)
        }
        
    }
}
