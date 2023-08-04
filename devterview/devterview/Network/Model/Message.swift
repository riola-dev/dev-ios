//
//  Chat.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/03.
//

import Foundation

var chatHistory: Array<Dictionary<String, String>> = []

// TODO: Message struct 활용하도록 수정 필요

//var chatHistory: [Message] = []

struct Message: Codable {
    let role: String
    let content: String
}
