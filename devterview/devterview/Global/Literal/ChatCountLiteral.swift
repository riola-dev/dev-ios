//
//  ChatCountLiteral.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/04.
//

import Foundation

enum ChatCountLiteral {
    
    /// 대화 한 사이클 수 (질문 -> 답변 -> 평가 -> 새 질문 요청)
    static let CHAT_CYCLE_COUNT = 4
    
    /// 첫 prompt + 질문 한 사이클(4) * 질문 수(5)
    static let MAXIMUM_CHAT_COUNT = 21
    
}
