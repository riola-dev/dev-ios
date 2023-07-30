//
//  DevterviewResultViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/30.
//

import UIKit

class DevterviewResultViewController: UIViewController {
    
    //MARK: - scrollView
    
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private let contentView = UIView()
    
    // MARK: - View
    private let resultScoreUIView = ResultScoreUIView()
    
    
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
    }
    
}
