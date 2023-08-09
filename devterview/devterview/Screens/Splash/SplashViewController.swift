//
//  SplashViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/08.
//

import UIKit

final class SplashViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - View

    private let imageView = {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .clear
        return $0
    }(UIImageView(image: ImageLiteral.splashImage))
    
    private let scrollView = {
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        return $0
    }(UIScrollView())
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.animateImage()
    }
    
    // MARK: - Method
    
    private func setupLayout() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        view.addSubview(scrollView)

        imageView.frame.size.height = view.frame.size.height
        scrollView.addSubview(imageView)

        imageView.frame.size.width = view.frame.size.height
    }
    
    private func animateImage() {
        let imageWidth = imageView.frame.size.width
        let contentWidth = imageWidth
        scrollView.contentSize = CGSize(width: imageWidth, height: view.frame.size.height)

        UIView.animate(withDuration: 1.2, delay: 0.5, options: [.curveLinear], animations: {
            // 스크롤뷰를 오른쪽으로 스크롤하여 이미지 오른쪽 끝까지 이동시킵니다.
            self.scrollView.contentOffset.x = contentWidth - self.scrollView.frame.size.width
        }, completion: { _ in
            self.imageView.layer.removeAllAnimations()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.5) {
                    self.imageView.alpha = 0
                } completion: { _ in
                    let viewController = DevterviewMainViewController()
                    let navigationViewController = UINavigationController(rootViewController: viewController)
                    navigationViewController.modalPresentationStyle = .fullScreen
                    navigationViewController.modalTransitionStyle = .crossDissolve
                    self.present(navigationViewController, animated: true, completion: nil)
                }
            }
        })
    }

}
