//
//  SettingTableViewCell.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/02.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    // MARK: - property
    
    static let identifier = "SettingTableViewCell"
    
    // MARK: - View
    
    private lazy var SettingMenuStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, linkIcon]))
    
    private let titleLabel = BasicLabel(
        contentText: "",
        fontStyle: .content01Regular,
        textColorInfo: .white
    )
    
    private let linkIcon: UIImageView = {
        $0.image = ImageLiteral.chevronRightSymbol
        $0.image?.withConfiguration(SFIconSize.regularIconSize)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .gray
        return $0
    }(UIImageView())
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func attribute() {
        self.selectionStyle = .none
        self.backgroundColor = .backgroundDark
    }
    
    private func setupLayout() {
        self.contentView.addSubview(SettingMenuStackView)
        self.SettingMenuStackView.constraint(to: self)
    }
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
