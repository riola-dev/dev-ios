//
//  StringLiteral.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit

enum StringLiteral {
    
    // MARK: - examples
    static let exampleQuestion = "Linked List의 개념을 설명할 수 있습니까? array에 비해 Linked List를 사용하는 장점과 단점은 무엇입니까?"
    static let exampleAnswer = "Linked List의 장점은 데이터 입력시 주소가 순차적이지 않아 요소를 메모리의 어느곳에나 둘 수 있습니다. (크기가 동적임) 또한 인덱스 대신 현재 위치의 이전 및 다음 위치를 기억하는 형태로, 요소 중간에 삽입, 삭제 시 논리적 주소만 바꿔주면 되기 때문에 요소(데이터) 삽입,삭제가 용이합니다.단점은 요소에 바로 접근이 가능하지 않고 연결되어 있는 링크를 따라가야만 접근이 가능하여 접근속도가 느리다는 것입니다.결론적으로 모든 원소의 값을 한 번에 읽어야 한다면 연결 리스트, 특정한 원소만 알고 싶으면 배열을 사용하는 것이 좋습니다."
    
    // MARK: - chatGPT prompt
    static let systemPrompt = """
                         지금부터 당신은 Software Engineer를 뽑기 위해 면접장에 나온 면접관 역할입니다. 면접관으로서 답변만 해주셨으면 합니다. 질문을 하시고 답변을 기다리십시오.
                         다음 주제 내에서 랜덤하게 한국어로 질문해주십시오. Computer Arichitecture, Data Structure, Algorithm, Database, Network & Security, Operating System, Design Pattern.
                         질문은 "질문 : ~~"과 같은 양식으로 해주십시오. 질문할 때 질문 외에 다른 말은 하지 마세요.
                         
                         제가 답변을 한 후에 답변을 평가해주십시오.
                         두가지 평가 기준이 있습니다. 우선 제가 질문에 맞는 답을 했는지 확인을 해야합니다. 그리고 구체적인 정도에 따라 0~10 사이의 점수로 평가해주십시오.
                         만약 답변이 틀렸거나 모르겠다고 답한 경우 0점을 주십시오. 특히 답변이 질문과 상관없는 내용인 경우 무조건 0점을 주십시오. 또한 답변이 아니라 질문을 하는 경우에도 0점을 주십시오.
                         그리고 점수와 함께 해당 점수를 준 이유와 개선할 부분, 만점 답변 예시를 알려주세요.
                         답변은 "점수 : (~/10),
                         해당 점수를 준 이유와 개선할 부분 : ~~,
                         만점 답변 예시: ~~"
                         와 같은 양식으로 해주십시오. 답변할 때 답변 외에 다른 말은 하지 마세요.
                         """
    
    // MARK: - QuestionViewController
    static let answerTextviewPlaceholder = "질문에 대한 답변을 작성해주세요."
    static let answerButton = "답변하기"
    static let passButton = "잘 모르겠어요, 패스할래요"
    
    // MARK: - ResultViewController
    static let saveImageButton = "이미지 저장"
    static let nextQuestionButton = "다음 질문"
    static let guideToSaveImage = """
                                현재는 내가 본 면접 내역을 저장할 수 없습니다.
                                해당 답변을 계속 확인하고 싶으시면 이미지를 저장해주세요
                                """
    
    // MARK: - DevterviewMainViewController
    
    static let categoryList: [String] = ["ALL\nComputer\nScience","Computer\nArchitecture", "Data\nStructure", "Algorithm", "Database",
                                         "Network\n&Security", "Operating\nSystem", "Design\nPattern"]
    static let categoryImageList: [String] = ["categoryImage01", "categoryImage02", "categoryImage03", "categoryImage04",
                                       "categoryImage05", "categoryImage06", "categoryImage07", "categoryImage08"]
    
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
    
}
