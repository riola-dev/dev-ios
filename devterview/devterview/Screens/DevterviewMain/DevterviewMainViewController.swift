//
//  DevterviewMainViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/27.
//

import UIKit

class DevterviewMainViewController: UIViewController {

    // MARK: - Property

    private let categoryList: [String] = ["Computer\nArchitecture", "Data\nStructure", "Algorithm", "Database",
                                      "Network\n&Security", "Operating\nSystem", "Design\nPattern"]

    private let categoryImageList: [String] = ["categoryImage01", "categoryImage02", "categoryImage03", "categoryImage04",
                                               "categoryImage05", "categoryImage06", "categoryImage07"]

    private let categoryListColor: [UIColor] = [.mainBule, .mainPink, .mainYellow, .mainSkyblue, .mainGreen,
                                                .mainOrange, .mainPurple]

    private enum Size {
        static let cellWidth: CGFloat = (UIScreen.main.bounds.width / 2)
    }

    // MARK: - View

    private lazy var categoryCollectionView = {
        $0.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "CategoryCollectionViewCell"
        )
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .clear
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: .createCompositionalLayout()))

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundDark
        setupLayout()
    }

    // MARK: - Method

    private func setupLayout() {
        self.view.addSubview(categoryCollectionView)
        categoryCollectionView.constraint(top: self.view.topAnchor,
                                          leading: self.view.leadingAnchor,
                                          bottom: self.view.bottomAnchor,
                                          trailing: self.view.trailingAnchor,
                                          padding: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16)
        )
    }
}

// MARK: - UICollectionViewDelegate

extension DevterviewMainViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource

// TODO - 카테고리 선택 시 터치이벤트 추가 필요
extension DevterviewMainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(title: categoryList[indexPath.item],
                       imageName: categoryImageList[indexPath.item],
                       color: categoryListColor[indexPath.item])
        return cell
    }

}

// MARK: - UICollectionViewLayout

extension UICollectionViewLayout {
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            //Item
            let elementSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )

            let leftItem = NSCollectionLayoutItem(layoutSize: elementSize)
            let rightItem = NSCollectionLayoutItem(layoutSize: elementSize)
            rightItem.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 0, bottom: -100, trailing: 0)

            //Vertical Groups
            let verticalGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.48),
                heightDimension: .fractionalHeight(1)
            )

            let leftVerticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                                     subitems: [leftItem])
            leftVerticalGroup.interItemSpacing = .fixed(10)

            let rightVerticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                                      subitems: [rightItem])
            rightVerticalGroup.interItemSpacing = .fixed(10)
            
            //Horizontal Group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [leftVerticalGroup, rightVerticalGroup])
            group.interItemSpacing = .flexible(5)

            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 30
            return section
        }
    }
}
