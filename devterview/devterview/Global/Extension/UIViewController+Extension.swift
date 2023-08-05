//
//  UIViewController+Extension.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/31.
//

import UIKit

extension UIViewController {
    
    // MARK: - enum
    
    enum NavigationBackButtonType {
        case goToPreviousVC
        case goToMainVC
    }
    
    // MARK: - keyboard
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - navigation bar
    
    func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        let appearance = UINavigationBarAppearance()
        let font = UIFont.setFont(.headline01Black)
        
        appearance.titleTextAttributes = [.font: font]
        appearance.shadowColor = .clear
        appearance.backgroundColor = .backgroundDark
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setCustomBackButton(type: NavigationBackButtonType) {
        
        let backButton = UIButton(type: .system)
        backButton.setImage(ImageLiteral.chevronLeftSymbol, for: .normal)
        backButton.tintColor = .white
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
        
        switch type {
        case .goToPreviousVC:
            return backButton.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
        case .goToMainVC:
            return backButton.addTarget(self, action: #selector(didBackButtonToMainTapped), for: .touchUpInside)
        }
    }
    
    @objc
    func didBackButtonTapped() {
        // TODO: 추후 alert 추가 시 chatHistory.removeAll()을 alert 확인하면 실행하도록 옮겨야 함
        chatHistory.removeAll()
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func didBackButtonToMainTapped() {
        showTwoButtonAlert(title: "뎁터뷰 그만두기",
                        message: "현재 진행중인 뎁터뷰를 중단하시겠습니까?\n지금까지 작성한 답변이 사라집니다.",
                        buttonName: "나가기",
                        buttonStyle: .destructive,
                        aciton: self.goToMainVC)
    }
    
    func goToMainVC() {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    func fixNavigationBarColorWhenScrollDown(fixingColor: UIColor = .backgroundDark) {
        guard let navigationBar = navigationController?.navigationBar else { return }
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = fixingColor
        appearance.shadowColor = .clear
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
    
    func setNavigationInlineTitle(title: String, color: UIColor = .white) {
        self.navigationItem.title = title
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : color]
        navigationBar.scrollEdgeAppearance?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : color]
    }
    
    func showTwoButtonAlert(title: String,
                         message: String,
                         buttonName: String,
                         buttonStyle: UIAlertAction.Style,
                         aciton: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: buttonName, style: buttonStyle, handler: { _ in
            aciton()
            
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(confirmButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showOneButtonAlert(title: String,
                         message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(confirmButton)
        
        present(alert, animated: true, completion: nil)
    }
}
