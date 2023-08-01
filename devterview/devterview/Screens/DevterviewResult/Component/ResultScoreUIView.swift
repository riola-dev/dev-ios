//
//  DevterviewScoreUIView.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class ResultScoreUIView: UIImageView {
    
    // MARK: - Property
    private var score: Int = 0
//    private var resultText = ""
    
    // MARK: - View
    
    private lazy var resultStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView(arrangedSubviews: [titielabel, scoreStackView, resultTextLabel]))
    
    private let titielabel = BasicLabel(contentText: "내 점수",
                                        fontStyle: .content02Bold,
                                        textColorInfo: .white)
    
    private lazy var scoreStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .bottom
        return $0
    }(UIStackView(arrangedSubviews: [scoreLabel, fullScoreLabel]))
    
    private lazy var scoreLabel : BasicLabel = {
        $0.setContentHuggingPriority(UILayoutPriority(rawValue: 700),
                                     for: .horizontal)
        $0.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 760),
                                                   for: .horizontal)
        return $0
    }(BasicLabel(contentText: String(score) + "점",
                 fontStyle: .largeTitle01,
                 textColorInfo: .white))
    
    private let fullScoreLabel: BasicLabel = {
        $0.setContentHuggingPriority(UILayoutPriority(rawValue: 500),
                                     for: .horizontal)
        $0.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500),
                                                   for: .horizontal)
        return $0
    }(BasicLabel(contentText: "/50점",
                 fontStyle: .content02Light,
                 textColorInfo: .gray))
    
    private lazy var resultTextLabel = BasicLabel(contentText: "",
                                                  fontStyle: .content02Light,
                                                  textColorInfo: .white)
    
    // MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
    init(score: Int) {
        super.init(frame: .zero)
        self.score = score
        setupLayout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Method
    
    private func attribute() {
        self.constraint(.widthAnchor, constant: BasicComponentSize.width)
        self.constraint(.heightAnchor, constant: 150)
        self.backgroundColor = .mainBule
        self.image = ImageLiteral.scoreBackgroundImage
        self.contentMode = .scaleAspectFit
    }
    
    private func setupLayout() {
        setResultText()
        self.addSubview(resultStackView)
        resultStackView.constraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   bottom: self.bottomAnchor,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 25, bottom: 30, right: 25))
    }
    
    private func setResultText() {
        //TODO - 점수에 따른 문구 변경 필요
        if score >= 50 {
            resultTextLabel.text = "최고에요"
        } else if score >= 40 {
            resultTextLabel.text = "40점대"
        }  else if score >= 30 {
            resultTextLabel.text = "30점대"
        } else if score >= 20 {
            resultTextLabel.text = "20점대"
        } else if score >= 10 {
            resultTextLabel.text = "10점대"
        }
    }
    
}
