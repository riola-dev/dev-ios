//
//  InterviewData.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/07.
//

import Foundation

struct InterviewData: Codable {
    var interviewQuestion: String
    var userAnswer: String
    var userAnswerScore: String
    var userAnswerScoreReason: String
    var perfectScoreExampleAnswer: String
    
    init(interviewQuestion: String,
         userAnswer: String,
         userAnswerScore: String,
         userAnswerScoreReason: String,
         perfectScoreExampleAnswer: String){
        self.interviewQuestion = interviewQuestion
        self.userAnswer = userAnswer
        self.userAnswerScore = userAnswerScore
        self.userAnswerScoreReason = userAnswerScoreReason
        self.perfectScoreExampleAnswer = perfectScoreExampleAnswer
    }
}
