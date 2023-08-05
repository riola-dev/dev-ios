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
        $0.font = UIFont(name: "GmarketSansBold", size: 20)
        $0.numberOfLines = 3
        $0.textColor = .white
        return $0
    }(UILabel())

    private let categoryImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    // MARK: - Init

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topRight, .bottomLeft], radius: 40.0)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }

    // MARK: - Method

    private func setupLayout() {
        self.contentView.addSubview(categoryImageView)
        self.categoryImageView.constraint(to: contentView)
        self.categoryImageView.addSubview(categoryTitleLabel)
        categoryTitleLabel.constraint(top: categoryImageView.topAnchor,
                                      leading: categoryImageView.leadingAnchor,
                                      padding: UIEdgeInsets(top: 18, left: 14, bottom: 0, right: 0))
    }

    func configure(title: String, imageName: String, color: UIColor) {
        self.categoryTitleLabel.setLabelLineHeight(text: title, lineHeight: 25)
        self.backgroundColor = color
        self.categoryImageView.image = UIImage(named: imageName)
    }
}
