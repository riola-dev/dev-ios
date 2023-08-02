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
        $0.text = "오랫동안 꿈을 그리는 사람은 마침내 그 꿈을 닮아 간다 오랫동안 꿈을 그리는 사람은 마침내 그 꿈을 닮아 간다"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let writersNameLabel: UILabel = {
        $0.font = UIFont(name: "GmarketSansLight", size: 12)
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.text = "마르코폴로"
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
}
