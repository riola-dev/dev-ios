//
//  DevterviewResultViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class DevterviewResultViewController: UIViewController {

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
        $0.backgroundColor = .backgroundDark
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
    
    private func attribute() {
        self.view.backgroundColor = .backgroundDark
    }
    
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
        
        let answerrVC = AnswerViewController(entryPoint: .resultDatail)
        answerrVC.configureResultDatail(interviewQuestion: interviewHistory[indexPath.row].interviewQuestion,
                                        userAnswer: interviewHistory[indexPath.row].userAnswer,
                                        userAnswerScore: interviewHistory[indexPath.row].userAnswerScore,
                                        userAnswerScoreReason: interviewHistory[indexPath.row].userAnswerScoreReason,
                                        perfectScoreExampleAnswer: interviewHistory[indexPath.row].perfectScoreExampleAnswer)
        self.navigationController?.pushViewController(answerrVC, animated: true)
        
    }
}

// MARK: - UICollectionViewDataSource

extension DevterviewResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interviewHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DevterviewHistoryCollectionViewCell",
            for: indexPath) as? DevterviewHistoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(question: interviewHistory[indexPath.row].interviewQuestion,
                       score: interviewHistory[indexPath.row].userAnswerScore)
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
        
        let totalScore: [Int] = interviewHistory.map { $0.userAnswerScore }
        header.configure(score: totalScore)
        return header
    }
}
