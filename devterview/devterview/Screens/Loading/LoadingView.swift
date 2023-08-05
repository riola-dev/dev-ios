//
//  LoadingView.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/04.
//

import UIKit

final class LoadingView: UIView {
    
    // MARK: - property
    
    var isLoading = false {
        didSet {
            self.isHidden = !self.isLoading
            self.isLoading ? self.activityIndicatorView.startAnimating() : self.activityIndicatorView.stopAnimating()
        }
    }
    
    // MARK: - view
    
    private let backgroundView = {
        $0.backgroundColor = .black.withAlphaComponent(0.4)
        return $0
    }(UIView())
    
    private let activityIndicatorView = {
        $0.color = .white
        return $0
    }(UIActivityIndicatorView(style: .large))
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - method
    
    private func setupLayout() {
        self.addSubview(backgroundView)
        self.backgroundView.constraint(top: self.topAnchor,
                                  leading: self.leadingAnchor,
                                  trailing: self.trailingAnchor,
                                  centerY: self.centerYAnchor)
        
        self.addSubview(activityIndicatorView)
        self.activityIndicatorView.constraint(centerX: self.centerXAnchor, centerY: self.centerYAnchor)
    }
    
}
