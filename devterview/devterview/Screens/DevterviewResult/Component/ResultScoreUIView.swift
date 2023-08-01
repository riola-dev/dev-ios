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
    
    // MARK: - View
    
    private lazy var resultStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .leading
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
    
    private lazy var scoreLabel = BasicLabel(contentText: String(score) + "점",
                                             fontStyle: .largeTitle01,
                                             textColorInfo: .white)
    
    private let fullScoreLabel = BasicLabel(contentText: "/50점",
                                            fontStyle: .content02Light,
                                            textColorInfo: .gray)
    
    private lazy var resultTextLabel = BasicLabel(contentText: "",
                                                  fontStyle: .content02Light,
                                                  textColorInfo: .white)
    
    // MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
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
        if score == 50 {
            resultTextLabel.text = "만점 축하드려요! 당신은 살아있는 CS 백과사전!"
        } else if score >= 40 {
            resultTextLabel.text = "멋져요! 이대로 공부하시면 당신은 CS 마스터!"
        }  else if score >= 30 {
            resultTextLabel.text = "잘했어요! 좀만 더 공부하면 CS 척척박사! "
        } else if score >= 20 {
            resultTextLabel.text = "잘하고 있어요! 좀만 더 열심히 하면 나도 CS 백과사전"
        } else if score >= 10 {
            resultTextLabel.text = "할 수 있어요! 뎁터뷰로 공부하다보면 빨리 늘 거에요! "
        } 
    }
    
    private func setCornerRadius() {
        self.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
}
