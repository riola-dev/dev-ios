//
//  BaseCollectionViewCell.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    func render() {
        // Override Layout
    }
    
    func configUI() {
        // View Configuration
    }
}
