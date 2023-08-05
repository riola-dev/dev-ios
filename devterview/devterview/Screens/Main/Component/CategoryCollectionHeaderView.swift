//
//  CategoryCollectionHeaderView.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/03.
//

import UIKit

// MARK: - CategoryCollectionHeaderView

class CategoryCollectionHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "CategoryCollectionHeaderView"
    
    // MARK: - View
    
    private lazy var lifeQuotesStack = LifeQuotesStackView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        self.addSubview(lifeQuotesStack)
        lifeQuotesStack.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     bottom: self.bottomAnchor,
                                     trailing: self.trailingAnchor,
                                     padding: UIEdgeInsets(top: 20, left: 0, bottom: 40, right: 0))
    }
}

// MARK: - CategoryCollectionFooterView

class CategoryCollectionFooterView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "CategoryCollectionFooterView"
    
    // MARK: - View
    
    private lazy var spacingView = UIView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        self.addSubview(spacingView)
        spacingView.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     bottom: self.bottomAnchor,
                                     trailing: self.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0))
    }
}

