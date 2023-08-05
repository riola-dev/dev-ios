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
    
    private let myDevterviewTitleLabel = BasicLabel(contentText: "내 뎁터뷰",
                                                    fontStyle: .content01Bold,
                                                    textColorInfo: .white)
    
    // MARK: - Method
    
    func configure(score: [Int]) {
        let sumScore = score.reduce(0, +)
        let totalScore = sumScore
        
       lazy var resultScoreUIView = ResultScoreUIView(score: totalScore)
        
        self.addSubview(resultScoreUIView)
        resultScoreUIView.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     trailing: self.trailingAnchor)
        
        self.addSubview(myDevterviewTitleLabel)
        myDevterviewTitleLabel.constraint(top: resultScoreUIView.bottomAnchor,
                                          padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right:0))
    }
}
