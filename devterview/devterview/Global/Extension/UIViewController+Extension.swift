//
//  UIViewController+Extension.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/31.
//

import MessageUI
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
    
    func setSendErrorMailButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "오류제보",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapSendErrorMailButton))
        navigationItem.rightBarButtonItem?.tintColor = .gray02
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.setFont(.content01Light)], for: .normal)
    }
    
    @objc
    private func didTapSendErrorMailButton() {
        var capturedImage: UIImage? = nil
        
        if hasScrollView(in: self.view) {
            capturedImage = captureScrollViewContent()
        } else {
            capturedImage = captureCurrentView()
        }
        sendErrorMail(capturedImage: capturedImage)
    }
    
    private func hasScrollView(in view: UIView) -> Bool {
        if view.subviews.first is UIScrollView { return true }
        return false
    }
    
    private func findScrollViewInView(_ view: UIView) -> UIScrollView? {
        if view is UIScrollView { return view as? UIScrollView }
        for subview in view.subviews {
            if let scrollView = findScrollViewInView(subview) { return scrollView }
        }
        return nil
    }
    
    
    func captureCurrentView() -> UIImage? {
        let captureSize = CGSize(width: view.bounds.width, height: view.bounds.height - (self.navigationController?.navigationBar.frame.height ?? 0))
        
        UIGraphicsBeginImageContextWithOptions(captureSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: -(self.navigationController?.navigationBar.frame.height ?? 0))
        view.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    private func captureScrollViewContent() -> UIImage? {
        if let scrollView = findScrollViewInView(self.view) {
            let image = scrollView.subviews.first?.transfromToImage()
            return image
        }
        return nil
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
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func didBackButtonToMainTapped() {
        showTwoButtonAlert(title: "뎁터뷰 그만두기",
                        message: "현재 진행중인 뎁터뷰를 중단하시겠습니까?\n지금까지 작성한 답변이 사라지고 뎁터뷰 진행횟수가 1회 차감됩니다.",
                        buttonName: "나가기",
                        buttonStyle: .destructive,
                        aciton: self.goToMainVC)
    }
    
    func goToMainVC() {
        chatHistory.removeAll()
        interviewHistory.removeAll()
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


// MARK: - MFMailComposeViewControllerDelegate

extension UIViewController: MFMailComposeViewControllerDelegate {
    
    func sendErrorMail(capturedImage: UIImage?) {
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            let devterviewEmail = StringLiteral.devterviewEmail
            let messageBody = StringLiteral.errorReportMailBody
            
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients([devterviewEmail])
            composeVC.setSubject(StringLiteral.errorReportMailTitle)
            composeVC.setMessageBody(messageBody, isHTML: false)
            
            if let imageData = capturedImage?.jpegData(compressionQuality: 0.8) {
                composeVC.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "captured_screen.jpg")
            }
            
            self.present(composeVC, animated: true, completion: nil)
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(
            title: "메일 전송 실패",
            message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.",
            preferredStyle: .alert
        )
        let confirmAction = UIAlertAction(title: "확인", style: .default) {
            (action) in
            print("확인")
        }
        sendMailErrorAlert.addAction(confirmAction)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    public func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true, completion: nil)
    }
}
