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
        $0.headerReferenceSize = CGSize(width: BasicComponentSize.width, height: 220)
        $0.footerReferenceSize = CGSize(width: BasicComponentSize.width, height: 100)
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
        $0.register(HistoryCollectionViewFooterView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: HistoryCollectionViewFooterView.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        
        self.view.addSubview(devterviewHistoryCollectionView)
        devterviewHistoryCollectionView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                                                   leading: view.safeAreaLayoutGuide.leadingAnchor,
                                                   bottom: view.bottomAnchor,
                                                   trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                                   padding: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16))
    }
    
}

// MARK: - UICollectionViewDelegate

// TODO - 카테고리 선택 시 터치이벤트 추가 필요
extension DevterviewResultViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource


extension DevterviewResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
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
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HistoryCollectionViewHeaderView.identifier,
                for: indexPath) as? HistoryCollectionViewHeaderView else {
                return HistoryCollectionViewHeaderView()
            }
            header.configure(score: scoreTest)
            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: HistoryCollectionViewFooterView.identifier,
                for: indexPath) as? HistoryCollectionViewFooterView else {
                return HistoryCollectionViewFooterView()
            }
            return footer
        }
    }
}
