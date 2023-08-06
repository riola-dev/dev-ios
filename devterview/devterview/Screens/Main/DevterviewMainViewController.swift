//
//  DevterviewMainViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/27.
//

import UIKit

//MARK: -  DevterviewMainViewController

final class DevterviewMainViewController: UIViewController {
    
    // MARK: - Property
    
    private let categoryListColor: [UIColor] = [
        .mainBlue, .mainPink, .mainYellow, .mainSkyblue, .mainGreen, .mainOrange, .mainPurple, .mainNavyBlue
    ]
    
    private var selectCategory = ""
    private var interviewCount = 0
    
    // MARK: - View
    
    private let appNameLabel = {
        $0.font = UIFont(name: "GmarketSansBold", size: 22)
        $0.text = "뎁터뷰"
        $0.numberOfLines = 1
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var categoryCollectionView = {
        $0.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "CategoryCollectionViewCell"
        )
        $0.register(CategoryCollectionHeaderView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: CategoryCollectionHeaderView.identifier)
        $0.register(CategoryCollectionFooterView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: CategoryCollectionFooterView.identifier)
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
        setNavigationBar()
        setNotificationObserver()
        interviewCount = UserDefaults.standard.integer(forKey: "interviewCount")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        
        self.view.addSubview(categoryCollectionView)
        categoryCollectionView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                                          leading: view.safeAreaLayoutGuide.leadingAnchor,
                                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                          trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                          padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    private func setNavigationBar() {
        fixNavigationBarColorWhenScrollDown()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: appNameLabel)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageLiteral.gearshapeFill,
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(didTapSettingButton))
    }
    
    private func setNotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(dayChanged),
                                               name: NSNotification.Name.NSCalendarDayChanged,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(countInterviwLimit),
                                               name: NSNotification.Name.interviewCount,
                                               object: nil)
    }
    
    // MARK: - @objc Method
    
    @objc
    func didTapSettingButton() {
        let vc = SettingViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func countInterviwLimit(notification : NSNotification){
        self.interviewCount += 1
        UserDefaults.standard.set(interviewCount, forKey: "interviewCount")
    }
    
    @objc func dayChanged(notification: Notification) {
        //TODO - 프린트문은 확인용 머지전에 삭제 예정
        print("날짜 변경됨 / 인터뷰 횟수 : \(UserDefaults.standard.integer(forKey: "interviewCount"))")
        UserDefaults.standard.removeObject(forKey: "interviewCount")
        print("날짜 변경됨 / 인터뷰 횟수 : \(UserDefaults.standard.integer(forKey: "interviewCount"))")
    }
}

// MARK: - UICollectionViewDelegate

// TODO - 카테고리 선택 시 터치이벤트 추가 필요
extension DevterviewMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let category = StringLiteral.categoryList[indexPath.item]
        
        switch category {
        case "ALL\nComputer\nScience":
            self.selectCategory = "Computer Arichitecture, Data Structure, Algorithm, Database, Network & Security, Operating System, Design Pattern."
            
        case "Computer\nArchitecture":
            self.selectCategory = "Computer Arichitecture"
            
        case "Data\nStructure":
            self.selectCategory = "Data Structure"
            
        case "Algorithm":
            self.selectCategory = "Algorithm"
            
        case "Database":
            self.selectCategory = "Database"
            
        case "Network\n&Security":
            self.selectCategory = "Network & Security"
            
        case "Operating\nSystem":
            self.selectCategory = "Operating System"
            
        case "Design\nPattern":
            self.selectCategory = "Design Pattern"
            
        default:
            self.selectCategory = "Computer Arichitecture, Data Structure, Algorithm, Database, Network & Security, Operating System, Design Pattern."
        }
        
        if UserDefaults.standard.integer(forKey: "interviewCount") >= 5 {
            showOneButtonAlert(title: "뎁터뷰 횟수 초과",
                               message: "이미 뎁터뷰를 5번 진행했어요\n오늘 인터뷰 내용을 꼼꼼히 공부한 후에\n내일 또 만나요")
        } else {
            lazy var noticePopupView : NoticePopupView = {
                $0.delegate = self
                return $0
            }(NoticePopupView(selectCategory: selectCategory))
            self.view.addSubview(noticePopupView)
            noticePopupView.constraint(to: self.view)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension DevterviewMainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        StringLiteral.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(title: StringLiteral.categoryList[indexPath.item],
                       imageName: StringLiteral.categoryImageList[indexPath.item],
                       color: categoryListColor[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: CategoryCollectionHeaderView.identifier,
                for: indexPath) as? CategoryCollectionHeaderView else {
                return CategoryCollectionHeaderView()
            }
            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: CategoryCollectionFooterView.identifier,
                for: indexPath) as? CategoryCollectionFooterView else {
                return CategoryCollectionFooterView()
            }
            return footer
        }
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
                heightDimension: .absolute(250.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [leftVerticalGroup, rightVerticalGroup])
            group.interItemSpacing = .flexible(5)
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 30
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(170.0))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            section.boundarySupplementaryItems = [header,footer]
            return section
        }
    }
}

// MARK: - NoticePopUpViewDelegate

extension DevterviewMainViewController: NoticePopUpViewDelegate {
    func startInterviewButtonTapped() {
        let vc = QuestionViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
