//
//  GuideView.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/01.
//

import UIKit

final class GuideView: UIView {
    
    // MARK: - view
    
    private let guideLabel: UILabel = {
        $0.font = UIFont.setFont(.captionMedium)
        $0.numberOfLines = 0
        $0.textColor = .gray01
        $0.text = ""
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    // MARK: - init

    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topRight, .bottomLeft], radius: 30.0)
    }
    
    init(guideText: String) {
        super.init(frame: .zero)
        self.guideLabel.text = guideText
        setupLayout()
        attribute()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - method
    
    private func attribute() {
        self.backgroundColor = .dark01
    }
    
    private func setupLayout() {
        self.constraint(.widthAnchor, constant: BasicComponentSize.width)
        
        self.addSubview(guideLabel)
        self.guideLabel.constraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   bottom: self.bottomAnchor,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 18, left: 20, bottom:18, right: 20))
    }
}
