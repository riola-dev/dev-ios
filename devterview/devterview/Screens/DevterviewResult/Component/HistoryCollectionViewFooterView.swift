//
//  HistoryCollectionViewFooterView.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/01.
//

import UIKit

final class HistoryCollectionViewFooterView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "HistoryCollectionViewFooterView"
    
    // MARK: - View
    private lazy var bottomButtonStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(arrangedSubviews: [imageDownloadButton, returnMainButton]))

    
    private lazy var imageDownloadButton: MainButton = {
        $0.setTitle("이미지 저장", for: .normal)
        let action = UIAction { [weak self] _ in
            // TODO - 이미지 저장 기능 구현
            print("이미지 저장 버튼 눌림")
        }
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(MainButton())
    
    private lazy var returnMainButton: MainButton = {
        $0.setTitle("홈으로", for: .normal)
        let action = UIAction { [weak self] _ in
            // TODO - 홈으로 돌아가기
            print("홈으로 버튼 눌림")
        }
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(MainButton())
    
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
        self.addSubview(bottomButtonStack)
        bottomButtonStack.constraint(top: self.topAnchor,
                                     leading: self.leadingAnchor,
                                     bottom: self.bottomAnchor,
                                     trailing: self.trailingAnchor,
                                     padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
   
    
}
