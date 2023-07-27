//
//  CategoryCollectionViewCell.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/27.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View
    
    private let categoryTitleLabel: UILabel = {
//        $0.font = UIFont.setFont(.content)
        $0.numberOfLines = 2
        $0.textColor = .white
        return $0
    }(UILabel())
    

}
