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
    
    // TODO: 질문 순서에 따라 text 변경
    private let pageIndicatorLabel: UILabel = {
        $0.font = .setFont(.content01Bold)
        $0.text = "1/5"
        $0.textColor = .gray01
        return $0
    }(UILabel())
    
    // TODO: 이전 화면 질문 반영
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
    
    private lazy var userAnswerView = AnswerStackView(type: .user, text: StringLiteral.exampleAnswer)
    private lazy var scoreView = AnswerStackView(type: .score, text: StringLiteral.exampleAnswer, score: 10)
    private lazy var assistantAnswerView = AnswerStackView(type: .assistant, text: StringLiteral.exampleAnswer)
    
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
    }
    
    // MARK: - method
    
    private func attribute() {
        self.setNavigationInlineTitle(title: "뎁터뷰")
        self.navigationController?.navigationBar.tintColor = .white
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

}
