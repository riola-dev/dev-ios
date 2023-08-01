//
//  HistoryCollectionViewHeaderView.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/01.
//

import UIKit

final class HistoryCollectionViewHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "HistoryCollectionViewHeaderView"
    
    // MARK: - View
    
    private lazy var resultScoreUIView = ResultScoreUIView(score: "40점")
    
    private let myDevterviewTitleLabel = BasicLabel(contentText: "내 뎁터뷰",
                                                    fontStyle: .content01Bold,
                                                    textColorInfo: .white)
    
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
        self.addSubview(resultScoreUIView)
        resultScoreUIView.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     trailing: self.trailingAnchor)
        
        self.addSubview(myDevterviewTitleLabel)
        myDevterviewTitleLabel.constraint(top: resultScoreUIView.bottomAnchor,
                                          padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right:0))
        
    }
    
    func configure(score: String) {
       lazy var resultScoreUIView = ResultScoreUIView(score: score)
    }
}
