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

    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: Size.cellWidth - 30, height: 250)
        $0.minimumLineSpacing = 30
        return $0
    }(UICollectionViewFlowLayout())

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
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout))

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundDark
        setupLayout()
    }

    // MARK: - Method
    private func setupLayout() {
        self.view.addSubview(categoryCollectionView)
        categoryCollectionView.constraint(top: self.view.safeAreaLayoutGuide.topAnchor,
                                          leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                                          bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                          trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                                          padding: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16)
        )
    }
}

// MARK: - UICollectionViewDelegate

extension DevterviewMainViewController: UICollectionViewDelegate {
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

// MARK: - UICollectionViewDataSource

// TODO - 카테고리 선택 시 터치이벤트 추가 필요
extension DevterviewMainViewController: UICollectionViewDataSource {

}
