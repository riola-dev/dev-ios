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
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .equalSpacing
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
    }(BasicLabel(contentText: "", fontStyle: .content02Regular, textColorInfo: .white))
    
    private let separatorLineView: UIView = {
        $0.frame = CGRect(x: 0, y:0, width: 100, height: 1)
        $0.backgroundColor = .white
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
                                             textColorInfo: .lightDark)
    
    private let scoreNumberLabel = BasicLabel(contentText: "",
                                              fontStyle: .content02Bold,
                                              textColorInfo: .lightDark)
    
    private lazy var answerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [answerTitleLabel, moveAnswerLabel]))
    
    private let answerTitleLabel = BasicLabel(contentText: "내 답변 보기",
                                             fontStyle: .caption,
                                             textColorInfo: .white)
    
    private let moveAnswerLabel: UIImageView = {
        $0.image = ImageLiteral.chevronRightSymbol
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let spaceView = UIView()
    
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
        self.backgroundColor = .lightDark
    }
    
    private func setupLayout() {
        self.contentView.addSubview(historyStackView)
        self.historyStackView.constraint(top: contentView.topAnchor,
                                          leading: contentView.leadingAnchor,
                                          bottom: contentView.bottomAnchor,
                                          trailing: contentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))

    }

    func configure(question: String, score: String) {
        self.questionContentLabel.text = question
        self.scoreNumberLabel.text = score
    }
    
    private func setRoundCorner() {
        roundCorners(corners: [.topRight, .bottomLeft], radius: 20.0)
    }
}


