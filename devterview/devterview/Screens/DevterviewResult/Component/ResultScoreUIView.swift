//
//  DevterviewScoreUIView.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class ResultScoreUIView: UIImageView {
    
    // MARK: - Property
    private var score = ""
    private var resultText = ""
    
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
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [scoreLabel, fullScoreLabel]))
    
    private lazy var scoreLabel : BasicLabel = {
        $0.setContentHuggingPriority(UILayoutPriority(rawValue: 700),
                                     for: .horizontal)
        $0.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 760),
                                                   for: .horizontal)
        return $0
    }(BasicLabel(contentText: score,
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
    
    private lazy var resultTextLabel = BasicLabel(contentText: resultText,
                                                  fontStyle: .content02Light,
                                                  textColorInfo: .white)
    
    // MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
    init(score: String, resultText: String) {
        super.init(frame: .zero)
        self.score = score
        self.resultText = resultText
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
        self.addSubview(resultStackView)
        resultStackView.constraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   bottom: self.bottomAnchor,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 25, bottom: 30, right: 25))
    }
    
}
