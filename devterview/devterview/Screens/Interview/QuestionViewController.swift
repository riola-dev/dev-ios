//
//  QuestionViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/31.
//

import UIKit

final class QuestionViewController: BaseViewController {
    
    // MARK: - view
    
    private let pageIndicatorLabel: UILabel = {
        $0.font = .setFont(.content01Bold)
        $0.text = ""
        $0.textColor = .gray01
        return $0
    }(UILabel())
    
    private var questionLabel: BasicLabel = {
        $0.numberOfLines = 0
        return $0
    }(BasicLabel(contentText: "",
                 fontStyle: .largeTitle01,
                 textColorInfo: .white))
    
    private let answerTextView = BasicTextView(
        placeholder: StringLiteral.answerTextviewPlaceholder
    )
    
    // TODO: 버튼 선택 시 "모르겠어요" 메세지 전송
    private lazy var passButton: UIButton = {
        let action = UIAction { [weak self] _ in
            if self?.answerButton.isActivated == true {
            }
        }
        let attributedText = NSAttributedString(string: StringLiteral.passButton,
                                                attributes: [.foregroundColor: UIColor.white,
                                                             .underlineStyle: NSUnderlineStyle.single.rawValue])
        
        $0.setAttributedTitle(attributedText, for: .normal)
        $0.titleLabel?.font = UIFont.setFont(.content02Light)
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(UIButton())
    
    // TODO: 답변 전송, 다음 화면 연결
    private lazy var answerButton: MainButton = {
        let action = UIAction { [weak self] _ in
            
        }
        $0.setTitle(StringLiteral.answerButton, for: .normal)
        $0.addAction(action, for: .touchUpInside)
        $0.isActivated = false
        return $0
    }(MainButton())
    
    
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
        self.pageIndicatorLabel.text = String((chatHistory.count / 4 + 1)) + "/5"
        if chatHistory.count >= 6 {
            self.questionLabel.text = chatHistory[chatHistory.count - 1]["content"]
        } else {
            self.questionLabel.text = chatHistory[1]["content"]
        }
        
    }
    
    private func setupLayout() {
        self.view.addSubview(pageIndicatorLabel)
        self.pageIndicatorLabel.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                                           leading: view.safeAreaLayoutGuide.leadingAnchor,
                                           padding: UIEdgeInsets(top: 34, left: 16, bottom: 0, right: 0))
        
        self.view.addSubview(questionLabel)
        self.questionLabel.constraint(top: self.pageIndicatorLabel.bottomAnchor,
                                      leading: view.safeAreaLayoutGuide.leadingAnchor,
                                      trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                      padding: UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16))

        self.view.addSubview(answerTextView)
        self.answerTextView.constraint(top: self.questionLabel.bottomAnchor,
                                       leading: view.safeAreaLayoutGuide.leadingAnchor,
                                       bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                       trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                       padding: UIEdgeInsets(top: 50, left: 16, bottom: 180, right: 16))
        
        self.view.addSubview(passButton)
        self.passButton.constraint(top: self.answerTextView.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
                                   trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                   padding: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16))
        
        self.view.addSubview(answerButton)
        self.answerButton.constraint(leading: view.safeAreaLayoutGuide.leadingAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: 16, bottom: 38, right: 16))
    }
    
}
