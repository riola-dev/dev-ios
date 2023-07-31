//
//  CheckMarkButton.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/29.
//

import UIKit

final class CheckMarkButton: UIButton {
    
    // MARK: - Property
    
    var isChecked: Bool = false {
        didSet {
            self.setImage(
                isChecked
                ? ImageLiteral.checkMarkCircleFillSymbol
                : ImageLiteral.checkmarkCircleSymbol
                , for: .normal)
            self.tintColor = isChecked ? .mainBule : .gray
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        attribute()
        self.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        self.isChecked = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    @objc func buttonClicked() {
        isChecked.toggle()
    }
    
    private func attribute() {
        self.setImage(ImageLiteral.checkmarkCircleSymbol, for: .normal)
        self.tintColor = .gray
        self.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
