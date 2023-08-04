//
//  BaseViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - property
    
    
    // MARK: - life cycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setCustomBackButton(type: .goToPreviousVC)
        hideKeyboardWhenTappedAround()
        setupNavigationBar()
    }
    
    private func attribute() {
        self.view.backgroundColor = .backgroundDark
    }
    
}
