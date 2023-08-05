//
//  DevterviewResultViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class DevterviewResultViewController: UIViewController {
    
    // MARK: - Property
    
    //TODO - 더미데이터 추후 데이터 연결 시에 삭제 예정
    private var questionTest = [ "최소 스패닝 트리(Minimum Spanning Tree)에 대해서 설명해주세요.", "Linked List의 개념을 설명할수 있습니까? array에 비해 Linked List을 사용하는 장점과 단점은 무엇입니까", "선점형 스케줄링과 비선점형 스케줄링의 차이는 무엇인가요?", "NoSQL 데이터베이스의 종류는 어떤 것이 있나요?","Linked List의 개념을 설명할수 있습니까? array에 비해 Linked List을 사용하는 장점과 단점은 무엇입니까?"]
    private var scoreTest = [7, 5, 4, 3, 2]
    
    // MARK: - View
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: BasicComponentSize.width, height: 170)
        $0.minimumLineSpacing = 20
        $0.headerReferenceSize = CGSize(width: BasicComponentSize.width, height: 240)
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var devterviewHistoryCollectionView = {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .clear
        $0.register(
            DevterviewHistoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "DevterviewHistoryCollectionViewCell"
        )
        $0.register(HistoryCollectionViewHeaderView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HistoryCollectionViewHeaderView.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setupLayout()
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        self.view.addSubview(devterviewHistoryCollectionView)
        devterviewHistoryCollectionView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                                                   leading: view.safeAreaLayoutGuide.leadingAnchor,
                                                   bottom: view.bottomAnchor,
                                                   trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                                   padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    private func setNavigationBar() {
        setCustomBackButton(type: .goToMainVC)
        fixNavigationBarColorWhenScrollDown()
        setNavigationInlineTitle(title: "뎁터뷰 결과")
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "오류제보",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
    }
}

// MARK: - UICollectionViewDelegate


extension DevterviewResultViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        //TODO - 각 질문에 맞는 답변 화면으로 연결 필요
        let AnswerrVC = AnswerViewController()
        self.navigationController?.pushViewController(AnswerrVC, animated: true)
        
    }
}

// MARK: - UICollectionViewDataSource

extension DevterviewResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        questionTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DevterviewHistoryCollectionViewCell",
            for: indexPath) as? DevterviewHistoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(question: questionTest[indexPath.item],
                       score: scoreTest[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HistoryCollectionViewHeaderView.identifier,
                for: indexPath
              ) as? HistoryCollectionViewHeaderView else {return UICollectionReusableView()}
        header.configure(score: scoreTest)
        return header
    }
}
