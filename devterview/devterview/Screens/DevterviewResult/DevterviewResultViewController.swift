//
//  DevterviewResultViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class DevterviewResultViewController: UIViewController {
    
    
    // MARK: - Property
    
    private var questionTest = [ "Linked List의 개념을 설명할수 있습니까?array에 비해 Linked List을 사용하는 장점과 단점은 무엇입니까?", "dfskldfdkjfskljfslkdfjkldjfksjfkl","Linked List의 개념을 설명할수 있습니까?array에 비해 Linked List을 사용하는 장점과 단점은 무엇입니까?", "dfskldfdkjfskljfslkdfjkldjfksjfkl","Linked List의 개념을 설명할수 있습니까?array에 비해 Linked List을 사용하는 장점과 단점은 무엇입니까?", "dfskldfdkjfskljfslkdfjkldjfksjfkl" ]
    
    //MARK: - scrollView
    
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private let contentView = UIView()
    
    // MARK: - View
    
    private lazy var resultScoreUIView = ResultScoreUIView(score: "40점", resultText: "어쩌구저쩌구")
    
    private let myDevterviewLabel = BasicLabel(contentText: "내 뎁터뷰",
                                               fontStyle: .content01Bold,
                                               textColorInfo: .white)
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: BasicComponentSize.width, height: 150)
//            $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumLineSpacing = 10
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var devterviewHistoryCollectionView = {
        $0.register(
            DevterviewHistoryCollectionViewCell.self,
            forCellWithReuseIdentifier: "DevterviewHistoryCollectionViewCell"
        )
        $0.isScrollEnabled = false
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .mainPink
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout))
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        
        view.addSubview(scrollView)
        scrollView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        scrollView.addSubview(contentView)
        contentView.constraint(top: scrollView.contentLayoutGuide.topAnchor,
                               leading: scrollView.contentLayoutGuide.leadingAnchor,
                               bottom: scrollView.contentLayoutGuide.bottomAnchor,
                               trailing: scrollView.contentLayoutGuide.trailingAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        self.view.addSubview(resultScoreUIView)
        resultScoreUIView.constraint(top: contentView.topAnchor,
                                     leading: contentView.leadingAnchor,
                                     trailing: contentView.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        self.view.addSubview(devterviewHistoryCollectionView)
        devterviewHistoryCollectionView.constraint(top: resultScoreUIView.bottomAnchor,
                                                   leading: contentView.leadingAnchor,
                                                   bottom: contentView.bottomAnchor,
                                                   trailing: contentView.trailingAnchor,
                                                   padding: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16))
        devterviewHistoryCollectionView.constraint(.heightAnchor, constant: 1500)
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DevterviewHistoryCollectionViewCell",
            for: indexPath) as? DevterviewHistoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(question: questionTest[indexPath.item],
                       score: "10점")
        
        return cell
    }

}

