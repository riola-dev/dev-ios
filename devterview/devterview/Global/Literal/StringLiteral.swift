//
//  StringLiteral.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit

enum StringLiteral {
    
    // MARK: - anywhere
    static let example = "예시 텍스트"
    
    // MARK: - chatGPT prompt
    static let systemPrompt = """
                         지금부터 당신은 Software Engineer를 뽑기 위해 면접장에 나온 면접관 역할입니다.
                         저에게 Computer Science 지식과 관련된 질문을 한국어로 해주십시오. 다음 주제 중 하나에서 무작위로 앞선 질문과 중복되지 않게 질문해주십시오.  Data Structure.
                         질문은 "질문 : ~~~"과 같은 양식으로 해주십시오. 질문 외에 별도의 설명을 작성하지 마십시오.
                         
                         질문을 하시고 답변을 기다리십시오. 그리고 제가 답변을 한 후에 답변을 평가해주십시오.
                          두가지 평가 기준이 있습니다. 우선 제가 질문에 맞는 답을 했는지 확인을 해야합니다. 그리고 답변의 구체적인 정도에 따라 1~10 사이의 점수로 평가해주십시오. 만약 답변이 틀렸거나 질문과 상관없는 내용인 경우, 혹은 모르겠다고 답한 경우 0점을 주십시오.
                         또한 해당 점수를 준 이유와 만점 답변 예시를 함께 알려주세요.
                         답변은 "점수 : (~/10), 해당 점수를 준 이유 :, 만점 답변 예시: "와 같은 양식으로 해주십시오.
                         """
    
    
    
    // MARK: - DevterviewMainViewController
    
    static let categoryList: [String] = ["Computer\nArchitecture", "Data\nStructure", "Algorithm", "Database",
                                         "Network\n&Security", "Operating\nSystem", "Design\nPattern"]
    static let categoryImageList: [String] = ["categoryImage01", "categoryImage02", "categoryImage03", "categoryImage04",
                                       "categoryImage05", "categoryImage06", "categoryImage07"]
    
    // MARK: - NoticePopupView
    
    static let noticePopupTitle = "뎁터뷰 안내사항"
    static let noticePopupSubTitle = "뎁터뷰 시작 전에 안내 사항을 알려드려요\n아래 사항을 확인해주세요!"
    static let firstNoticeTitle = "뎁터뷰는 최대 5번"
    static let firstNoticeContent = "뎁터뷰는 하루에 5번(30문제) 할 수 있어요!\n매일매일 뎁터뷰를 통해 공부해보세요"
    static let secondNoticeTitle = "뎁터뷰 질문은 랜덤 5개"
    static let secondNoticeContent = "선택한 분야에서 랜덤으로 5개의 질문이 출제돼요\n만약, 질문이 이상하면 오류제보를 부탁드려요!"
    static let thirdNoticeTitle = "뎁터뷰 이미지 저장"
    static let thirdNoticeContent = "계속 보고 싶은 뎁터뷰는 이미지 저장해서 계속 확인할 수 있어요.하단의 버튼을 통해 저장해주세요"
    
    // MARK: - ResultScoreUIView
    
    static let perfectScoreText = "만점 축하드려요! 당신은 살아있는 CS 백과사전!"
    static let Score40Text = "멋져요! 이대로 공부하시면 당신은 CS 마스터!"
    static let Score30Text =  "잘했어요! 좀만 더 공부하면 CS 척척박사!"
    static let Score20Text = "잘하고 있어요! 좀만 더 열심히 하면 나도 CS 백과사전"
    static let Score10Text = "화이팅! 저희와 함께 공부하다보면 CS지식이 쑥쑥!"
    
    // MARK: - SettingViewController
    
    static let privacyPolicyNotionURL = "https://chain-hyssop-308.notion.site/11698780785747f182077d329163574a?pvs=4"
    static let thirdPartyInfoNotionURL = "https://chain-hyssop-308.notion.site/a7e8bd0c250e43da80396f1ffeea507f?pvs=4"
    static let supportDeveloperURL = "https://devterview.postype.com/post/15025004"
    
}
