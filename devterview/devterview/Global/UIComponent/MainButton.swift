//
//  mainButton.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/29.
//

import UIKit

final class MainButton: UIButton {
    
    // MARK: - Property
    
    var isActivated: Bool = false {
        didSet {
            self.tintColor = isActivated ? .white : .gray02
            self.backgroundColor = isActivated ? .mainBlue : .gray03
        }
    }

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    
    private func attribute() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.setFont(.content01Bold)
        self.constraint(.heightAnchor, constant: 60)
    }
}
