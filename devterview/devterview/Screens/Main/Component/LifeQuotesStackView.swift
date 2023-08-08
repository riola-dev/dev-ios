//
//  LifeQuotesVIew.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/28.
//

import UIKit

class LifeQuotesStackView: UIStackView {

    // MARK: - View
    
    private let lifeQuotesLabel: UILabel = {
        $0.font = UIFont(name: "GmarketSansMedium", size: 14)
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let writersNameLabel: UILabel = {
        $0.font = UIFont(name: "GmarketSansLight", size: 12)
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.text = ""
        $0.textAlignment = .center
        return $0
    }(UILabel())
    

    // MARK: - Init

    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        attribute()
        setupLayout()
        setRandomQuote()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    
    private func attribute() {
        self.axis = .vertical
        self.spacing = 8
        self.distribution = .fill
        self.constraint(.widthAnchor, constant: BasicComponentSize.width)
        self.backgroundColor = .dark01
    }
    
    private func setupLayout() {
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = UIEdgeInsets(top: 18.0, left: 20.0, bottom: 18.0, right: 20.0)
        self.addArrangedSubview(lifeQuotesLabel)
        self.addArrangedSubview(writersNameLabel)
    }
    
    private func setRandomQuote() {
        let random = Int.random(in: 0...55)
        let quote = lifeQuotes[random]
        self.lifeQuotesLabel.text = quote.content
        self.writersNameLabel.text = quote.writersName
    }
}
