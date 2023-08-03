//
//  AnswerStackView.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/02.
//

import UIKit

final class AnswerStackView: UIStackView {
    
    // MARK: - Property
    
    private var type: answerType = .user
    
    enum answerType: String {
        case user = "내 답변"
        case score = "답변 점수"
        case assistant = "10점 답안"
        
        var backgroundColor: UIColor {
            switch self {
            case .user:
                return .gray03
            case .score:
                return .mainBlue
            case .assistant:
                return .mainPink
            }
        }
        
        var contentsColor: UIColor {
            switch self {
            case .user, .score:
                return .white
            case .assistant:
                return .backgroundDark
            }
        }
    }
    
    
    // MARK: - View
    
    private let headerLabel = BasicLabel(contentText: "",
                                           fontStyle: .content01Bold,
                                           textColorInfo: .white)
    
    private let answerLabel = {
        $0.font = UIFont.setFont(.content01Regular)
        $0.numberOfLines = 0
        $0.text = ""
        return $0
    }(UILabel())
    
    private lazy var answerStack = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fill
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 22.0, left: 22.0, bottom: 28.0, right: 22.0)
        return $0
    }(UIStackView(arrangedSubviews: []))

    private let scoreTextLabel = BasicLabel(contentText: "점수",
                                           fontStyle: .content01Light,
                                           textColorInfo: .white)
    
    private let scoreLabel = BasicLabel(contentText: "5점",
                                           fontStyle: .largeTitle02,
                                           textColorInfo: .white)
    
    private lazy var scoreStack = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
        return $0
    }(UIStackView(arrangedSubviews: [scoreTextLabel, scoreLabel]))
    
    // MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        answerStack.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
    init(type: answerType, text: String) {
        super.init(frame: .zero)
        self.type = type
        self.headerLabel.text = self.type.rawValue
        self.answerLabel.setLabelLineHeight(text: text, lineHeight: 24)
        setupLayout()
        attribute()
    }
    
    // type == .score 인 경우
    init(type: answerType, text: String, score: Int) {
        super.init(frame: .zero)
        self.type = type
        self.headerLabel.text = self.type.rawValue
        self.answerLabel.setLabelLineHeight(text: text, lineHeight: 24)
        self.scoreLabel.text = "\(score)점"
        setupLayout()
        attribute()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    
    private func attribute() {
        self.axis = .vertical
        self.spacing = 20
        self.distribution = .fill
        answerLabel.textColor = type.contentsColor
        answerStack.backgroundColor = type.backgroundColor
    }
    
    private func setupLayout() {
        self.addArrangedSubview(headerLabel)
        
        if self.type == .score {
            answerStack.addArrangedSubview(scoreStack)
            answerStack.addArrangedSubview(LineView(color: .mainSkyblue))
            answerStack.addArrangedSubview(answerLabel)
        } else {
            answerStack.addArrangedSubview(answerLabel)
        }
        
        self.addArrangedSubview(answerStack)
    }
    
}
