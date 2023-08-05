//
//  devterviewHistoryCollectionViewCell.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/31.
//

import UIKit

final class DevterviewHistoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View
    
    private lazy var historyStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .fill
        return $0
    }(UIStackView(arrangedSubviews: [questionStackView, separatorLineView, myResultStackView]))
    
    private lazy var questionStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .top
        return $0
    }(UIStackView(arrangedSubviews: [questionLabel, questionContentLabel]))
    
    private let questionLabel = BasicLabel(contentText: "Q.", fontStyle: .headline01Bold, textColorInfo: .white)
    
    private let questionContentLabel: BasicLabel = {
        $0.numberOfLines = 0
        return $0
    }(BasicLabel(contentText: "", fontStyle: .content01Regular, textColorInfo: .white))
    
    private let separatorLineView: UIView = {
        $0.constraint(.heightAnchor, constant: 1)
        $0.backgroundColor = .gray
        return $0
    }(UIView())
    
    private lazy var myResultStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView(arrangedSubviews: [scoreStackView, answerStackView]))
    
    private lazy var scoreStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.alignment = .top
        $0.backgroundColor = .mainOrange
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        $0.layer.cornerRadius = 13
        return $0
    }(UIStackView(arrangedSubviews: [scoreTitleLabel, scoreNumberLabel]))
    
    private let scoreTitleLabel = BasicLabel(contentText: "점수",
                                             fontStyle: .content02Light,
                                             textColorInfo: .dark01)
    
    private let scoreNumberLabel = BasicLabel(contentText: "",
                                              fontStyle: .content02Bold,
                                              textColorInfo: .dark01)
    
    private lazy var answerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [answerTitleLabel, moveAnswerLabel]))
    
    private let answerTitleLabel = BasicLabel(contentText: "내 답변 보기",
                                              fontStyle: .content02Light,
                                              textColorInfo: .gray)
    
    private let moveAnswerLabel: UIImageView = {
        $0.image = ImageLiteral.chevronRightSymbol
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    
    // MARK: - Init

    override func layoutSubviews() {
        super.layoutSubviews()
        setRoundCorner()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        attribute()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        attribute()
        setupLayout()
    }

    // MARK: - Method
    
    private func attribute() {
        self.backgroundColor = .dark02
    }
    
    private func setupLayout() {
        self.contentView.addSubview(historyStackView)
        self.historyStackView.constraint(top: contentView.topAnchor,
                                         leading: contentView.leadingAnchor,
                                         bottom: contentView.bottomAnchor,
                                         trailing: contentView.trailingAnchor,
                                         padding: UIEdgeInsets(top: 20, left: 18, bottom: 20, right: 18))
    }

    func configure(question: String, score: Int) {
        self.questionContentLabel.text = question
        self.scoreNumberLabel.text = String(score) + "점"
        
        setScoreBackgroundColor(score: score)
    }
    
    private func setRoundCorner() {
        roundCorners(corners: [.topRight, .bottomLeft], radius: 20.0)
    }
    
    private func setScoreBackgroundColor(score: Int) {
        if score > 6 {
            scoreStackView.backgroundColor = .mainGreen
        } else if score > 3 {
            scoreStackView.backgroundColor = .mainYellow
        } else {
            scoreStackView.backgroundColor = .mainOrange
        }
    }
    
}
