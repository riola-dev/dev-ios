//
//  SettingViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/02.
//

import MessageUI
import SafariServices
import UIKit

class SettingViewController: UIViewController {
    
    // MARK: - property
    
    private struct CellConfiguration {
        let title: String
        let handler: () -> Void
    }
    
    private var options = [CellConfiguration]()
    
    // MARK: - View
    
    private lazy var settingTableView: UITableView = {
        $0.backgroundColor = .clear
        return $0
    }(UITableView())
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setTableView()
        setupLayout()
    }
    
    // MARK: - Method
    
    private func attribute() {
        self.view.backgroundColor = .backgroundDark
        setNavigationBar()
    }
    
    private func setupLayout() {
        configureModels()
        self.view.addSubview(self.settingTableView)
        self.settingTableView.constraint(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: self.view.safeAreaLayoutGuide.leadingAnchor,
            bottom: self.view.bottomAnchor,
            trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        )
    }
    
    private func setTableView() {
        self.settingTableView.delegate = self
        self.settingTableView.dataSource = self
        self.settingTableView.register(
            SettingTableViewCell.self,
            forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    private func setNavigationBar() {
        setCustomBackButton(type: .goToPreviousVC)
        fixNavigationBarColorWhenScrollDown()
        setNavigationInlineTitle(title: "설정")
        self.navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - Table Cell Method

extension SettingViewController {
    private func configureModels() {
        options.append(CellConfiguration(title: "개인정보처리방침", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.goToPrivacyPolicy()
            }
        }))
        options.append(CellConfiguration(title: "문의하기", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.sendReportMail()
            }
        }))
        options.append(CellConfiguration(title: "서드파티 정보", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.goToThirdPartyInfo()
            }
        }))
    }
    
    func goToPrivacyPolicy() {
        if let notionURL = NSURL(string: URLLiteral.privacyPolicyNotionURL) {
            let notionSafariView: SFSafariViewController = SFSafariViewController(url: notionURL as URL)
            self.present(notionSafariView, animated: true, completion: nil)
        }
    }
    
    func goToThirdPartyInfo() {
        if let notionURL = NSURL(string: URLLiteral.thirdPartyInfoNotionURL) {
            let notionSafariView: SFSafariViewController = SFSafariViewController(url: notionURL as URL)
            self.present(notionSafariView, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDelegate

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDataSource

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath ) as? SettingTableViewCell
        else { return UITableViewCell()}
        
        let model = options[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.configure(title: model.title)
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - send mail

extension SettingViewController {
    private func sendReportMail() {
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            let devterviewEmail = StringLiteral.devterviewEmail
            let messageBody = StringLiteral.commonReportMailBody
            
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients([devterviewEmail])
            composeVC.setSubject(StringLiteral.commonReportMailTitle)
            composeVC.setMessageBody(messageBody, isHTML: false)
            
            self.present(composeVC, animated: true, completion: nil)
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
}

