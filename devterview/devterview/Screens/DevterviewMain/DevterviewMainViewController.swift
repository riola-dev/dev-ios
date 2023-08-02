//
//  DevterviewMainViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/27.
//

import UIKit

//MARK: - CategoryData

struct CategoryData {
    
    let categoryList: [String] = [
        "Computer\nArchitecture", "Data\nStructure", "Algorithm", "Database",
        "Network\n&Security", "Operating\nSystem", "Design\nPattern"
    ]
    
    let categoryImageList: [String] = [
        "categoryImage01", "categoryImage02", "categoryImage03", "categoryImage04",
        "categoryImage05", "categoryImage06", "categoryImage07"
    ]
    
    let categoryListColor: [UIColor] = [
        .mainBlue, .mainPink, .mainYellow, .mainSkyblue, .mainGreen, .mainOrange, .mainPurple
    ]
}

//MARK: -  DevterviewMainViewController

class DevterviewMainViewController: UIViewController {
    
    //MARK: - scrollView
    
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private let contentView = UIView()
    
    // MARK: - View
    
    private let appNameLabel = {
        $0.font = UIFont(name: "GmarketSansBold", size: 22)
        $0.text = "뎁터뷰"
        $0.numberOfLines = 1
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private let settingButton = {
        let imageConfiguation = UIImage.SymbolConfiguration(pointSize: 22)
        $0.setImage(UIImage(systemName: "gearshape.fill", withConfiguration: imageConfiguation), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
        return $0
    }(UIButton())
    
    private lazy var topbarStackView = {
        $0.axis = .horizontal
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [appNameLabel, settingButton]))
    
    private lazy var lifeQuotesStack: LifeQuotesStackView = {
        return $0
    }(LifeQuotesStackView())
    
    private lazy var categoryCollectionView = {
        $0.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "CategoryCollectionViewCell"
        )
        $0.isScrollEnabled = false
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
        didTapSettingButton()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Method

    private func setupLayout() {
        
        view.addSubview(scrollView)
        scrollView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        scrollView.addSubview(contentView)
        contentView.constraint(top: scrollView.contentLayoutGuide.topAnchor,
                               leading: scrollView.contentLayoutGuide.leadingAnchor,
                               bottom: scrollView.contentLayoutGuide.bottomAnchor,
                               trailing: scrollView.contentLayoutGuide.trailingAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        self.view.addSubview(topbarStackView)
        topbarStackView.constraint(top: contentView.topAnchor,
                                   leading: contentView.leadingAnchor,
                                   trailing: contentView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        self.view.addSubview(lifeQuotesStack)
        lifeQuotesStack.constraint(top: topbarStackView.bottomAnchor,
                                   leading: contentView.leadingAnchor,
                                   trailing: contentView.trailingAnchor,
                                   padding: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16))
        
        self.view.addSubview(categoryCollectionView)
        categoryCollectionView.constraint(.heightAnchor, constant: 1100)
        categoryCollectionView.constraint(top: lifeQuotesStack.bottomAnchor,
                                          leading: contentView.leadingAnchor,
                                          bottom: contentView.bottomAnchor,
                                          trailing: contentView.trailingAnchor,
                                          padding: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16))
    }
    
    private func didTapSettingButton() {
        let action = UIAction { _ in
            print("설정 눌림")
        }
        self.settingButton.addAction(action, for: .touchUpInside)
    }
}

// MARK: - UICollectionViewDelegate

// TODO - 카테고리 선택 시 터치이벤트 추가 필요
extension DevterviewMainViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource


extension DevterviewMainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CategoryData().categoryList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(title: CategoryData().categoryList[indexPath.item],
                       imageName: CategoryData().categoryImageList[indexPath.item],
                       color: CategoryData().categoryListColor[indexPath.item])
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
            rightItem.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 0, bottom: -80, trailing: 0)

            //Vertical Groups
            let verticalGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.48),
                heightDimension: .fractionalHeight(1))

            let leftVerticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                                     subitems: [leftItem])
            leftVerticalGroup.interItemSpacing = .fixed(10)

            let rightVerticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                                      subitems: [rightItem])
            rightVerticalGroup.interItemSpacing = .fixed(10)
            
            //Horizontal Group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.22)
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
