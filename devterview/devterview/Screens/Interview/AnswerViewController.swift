//
//  AnswerViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/02.
//

import UIKit

final class AnswerViewController: BaseViewController {
    
    // MARK: - view
    
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private lazy var contentView = {
        $0.axis = .vertical
        $0.spacing = 40
        $0.distribution = .fill
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 34, left: 16.0, bottom: 34, right: 16.0)
        return $0
    }(UIStackView(arrangedSubviews:[headerStack,userAnswerView, LineView(color: .gray03), scoreView,
                                    LineView(color: .gray03), assistantAnswerView,guideToSaveImageView,
                                   bottomButtonStack]))
    
    private let pageIndicatorLabel: UILabel = {
        $0.font = .setFont(.content01Bold)
        $0.text = ""
        $0.textColor = .gray01
        return $0
    }(UILabel())
    
    private var questionLabel: BasicLabel = {
        $0.numberOfLines = 0
        return $0
    }(BasicLabel(contentText: StringLiteral.exampleQuestion,
                 fontStyle: .largeTitle01,
                 textColorInfo: .white))
    
    private lazy var headerStack = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        return $0
    }(UIStackView(arrangedSubviews:[pageIndicatorLabel, questionLabel]))
    
    private lazy var userAnswerView = AnswerStackView(type: .user, text: "")
    private lazy var scoreView = AnswerStackView(type: .score, text: "", score: 10)
    private lazy var assistantAnswerView = AnswerStackView(type: .assistant, text: "")
    
    private let guideToSaveImageView = GuideView(guideText: StringLiteral.guideToSaveImage)
    
    // TODO: 이미지 저장
    private lazy var saveImageButton: MainButton = {
        let action = UIAction { [weak self] _ in
            
        }
        $0.setTitle(StringLiteral.saveImageButton, for: .normal)
        $0.addAction(action, for: .touchUpInside)
        $0.isActivated = true
        return $0
    }(MainButton())
    
    // TODO: 다음 화면으로 연결, 마지막 질문인 경우 결과 화면으로 연결
    private lazy var nextQuestionButton: MainButton = {
        let action = UIAction { [weak self] _ in
            
        }
        $0.setTitle(StringLiteral.nextQuestionButton, for: .normal)
        $0.addAction(action, for: .touchUpInside)
        $0.isActivated = true
        return $0
    }(MainButton())
    
    private lazy var bottomButtonStack = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
        $0.constraint(.heightAnchor, constant: 60)
        return $0
    }(UIStackView(arrangedSubviews: [saveImageButton, nextQuestionButton]))
    
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.setupLayout()
        self.parsingAnswerFromResponse()
    }
    
    // MARK: - method
    
    private func attribute() {
        self.setNavigationInlineTitle(title: "뎁터뷰")
        self.navigationController?.navigationBar.tintColor = .white
        self.pageIndicatorLabel.text = String(((chatHistory.count - 2) / 4 + 1)) + "/5"
        self.questionLabel.text = chatHistory[chatHistory.count - 4]["content"]
        self.userAnswerView.answerLabel.text = chatHistory[chatHistory.count - 3]["content"]
    }
    
    private func setupLayout() {
        self.view.addSubview(scrollView)
        scrollView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        self.scrollView.addSubview(contentView)
        contentView.constraint(top: scrollView.contentLayoutGuide.topAnchor,
                               leading: scrollView.contentLayoutGuide.leadingAnchor,
                               bottom: scrollView.contentLayoutGuide.bottomAnchor,
                               trailing: scrollView.contentLayoutGuide.trailingAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    }
    
    private func parsingAnswerFromResponse() {
        let answer = chatHistory[chatHistory.count - 2]["content"]
        if let components = answer?.components(separatedBy: "\n") {
            print(components)
            if components.count >= 3 {
                let scoreComponent = components[0].replacingOccurrences(of: "점수: ", with: "")
                let reasonAndImprovementComponent = components[1].replacingOccurrences(of: "해당 점수를 준 이유와 개선할 부분: ", with: "")
                var perfectScoreExampleComponent: String = ""
                for i in 2...components.count-1 {
                    let text = components[i].replacingOccurrences(of: "만점 답변 예시: ", with: "")
                    perfectScoreExampleComponent.append(text)
                }
                
                self.scoreView.scoreLabel.text = scoreComponent + "점"
                self.scoreView.answerLabel.text = reasonAndImprovementComponent
                self.assistantAnswerView.answerLabel.text = perfectScoreExampleComponent
            } else {
                print("올바르지 않은 형태의 답변을 받았습니다.")
            }
        }
    }

}
