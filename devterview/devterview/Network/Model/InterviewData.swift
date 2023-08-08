//
//  InterviewData.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/07.
//

import Foundation

var interviewHistory: [InterviewData] = []

struct InterviewData {
    var interviewQuestion: String
    var userAnswer: String
    var userAnswerScore: Int
    var userAnswerScoreReason: String
    var perfectScoreExampleAnswer: String
}
