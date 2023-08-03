//
//  LineView.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/03.
//

import UIKit

final class LineView: UIView {
    
    init(color: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = color
        self.constraint(.heightAnchor, constant: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
