//
//  NoticePopupViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/28.
//

import UIKit

// MARK: - NoticePopUpViewDelegate

protocol NoticePopUpViewDelegate: AnyObject {
    func startInterviewButtonTapped()
}

// MARK: - NoticePopupView

final class NoticePopupView: UIView {
    
    weak var delegate: NoticePopUpViewDelegate?
    private var selectCategory = ""
    private var systemPrompt = ""
    
    // MARK: - View
    
    private let containerView: UIView = {
        $0.backgroundColor = .dark01
        $0.layer.cornerRadius = 20
        return $0
    }(UIView())
    
    private lazy var dismissButton: UIButton = {
        $0.setImage(ImageLiteral.xmarkSymbol, for: .normal)
        $0.tintColor = .white
        let action = UIAction { [weak self] _ in
            self?.removeFromSuperview()
        }
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var titleStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .center
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, subTitleLabel]))
    
    private let titleLabel = BasicLabel(contentText: StringLiteral.noticePopupTitle,
                                        fontStyle: .headline01Bold,
                                        textColorInfo: .white)
    
    private let subTitleLabel: BasicLabel = {
        $0.numberOfLines = 2
        $0.textAlignment = .center
        return $0
    }(BasicLabel(contentText: StringLiteral.noticePopupSubTitle,
                 fontStyle: .content01Regular,
                 textColorInfo: .white))
    
    private lazy var infoStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 30
        return $0
    }(UIStackView(arrangedSubviews: [firstInfoStackView,
                                     secondInfoStackView,
                                     thirdInfoStackView]))
    
    private lazy var firstInfoStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .top
        $0.spacing = 22
        return $0
    }(UIStackView(arrangedSubviews: [firstInfoImageView,
                                     firstInfoLabelStackView]))
    
    private let firstInfoImageView: UIImageView = {
        $0.image = ImageLiteral.musicmicSymbol
        $0.constraint(.widthAnchor, constant: 30)
        $0.constraint(.heightAnchor, constant: 30)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let firstInfoLabelStackView: UIStackView = {
        
        let titleLabel = BasicLabel(
            contentText: StringLiteral.firstNoticeTitle,
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 2
            return $0
        }(BasicLabel(
            contentText: StringLiteral.firstNoticeContent,
            fontStyle: .captionRegualr,
            textColorInfo: .white))
        
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 6
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(contentLabel)
        return $0
    }(UIStackView())
    
    private lazy var secondInfoStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .top
        $0.spacing = 13
        return $0
    }(UIStackView(arrangedSubviews: [secondInfoImageView,
                                     secondInfoLabelStackView]))
    
    private let secondInfoImageView: UIImageView = {
        $0.image = ImageLiteral.twoBubbleSymbol
        $0.constraint(.widthAnchor, constant: 35)
        $0.constraint(.heightAnchor, constant: 30)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let secondInfoLabelStackView: UIStackView = {
        
        let titleLabel = BasicLabel(
            contentText: StringLiteral.secondNoticeTitle,
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 2
            return $0
        }(BasicLabel(
            contentText: StringLiteral.secondNoticeContent,
            fontStyle: .captionRegualr,
            textColorInfo: .white))
        
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 6
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(contentLabel)
        return $0
    }(UIStackView())
    
    private lazy var thirdInfoStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .top
        $0.spacing = 13
        return $0
    }(UIStackView(arrangedSubviews: [thirdInfoImageView,
                                     thirdInfoLabelStackView]))
    
    private let thirdInfoImageView: UIImageView = {
        $0.image = ImageLiteral.cmaeraFillSymbol
        $0.constraint(.widthAnchor, constant: 35)
        $0.constraint(.heightAnchor, constant: 30)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let thirdInfoLabelStackView: UIStackView = {
        
        let titleLabel = BasicLabel(
            contentText: StringLiteral.thirdNoticeTitle,
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 0
            return $0
        }(BasicLabel(
            contentText: StringLiteral.thirdNoticeContent,
            fontStyle: .captionRegualr,
            textColorInfo: .white))
        
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 6
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(contentLabel)
        return $0
    }(UIStackView())
    
    private lazy var startInterviewButton: MainButton = {
        $0.setTitle("뎁터뷰 시작", for: .normal)
        $0.isActivated = true
        return $0
    }(MainButton())
    
    private let loadingView = LoadingView()
    
    // MARK: - Init
    
    init(selectCategory: String) {
        super.init(frame: .zero)
        self.selectCategory = selectCategory
        setupLayout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func attribute() {
        self.backgroundColor = .black.withAlphaComponent(0.4)
        self.loadingView.isHidden = true
    }
    
    private func setupLayout() {
        self.addSubview(containerView)
        containerView.constraint(leading: self.leadingAnchor,
                                 trailing: self.trailingAnchor,
                                 centerY: self.centerYAnchor,
                                 padding: UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22))
        
        containerView.addSubview(titleStackView)
        titleStackView.constraint(top: containerView.topAnchor,
                                  leading: containerView.leadingAnchor,
                                  trailing: containerView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 30, left: 26, bottom: 0, right: 26))
        
        containerView.addSubview(dismissButton)
        dismissButton.constraint(top: containerView.topAnchor,
                                 trailing: containerView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20))
        
        containerView.addSubview(infoStackView)
        infoStackView.constraint(top: titleStackView.bottomAnchor,
                                 leading: containerView.leadingAnchor,
                                 trailing: containerView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 36, left: 30, bottom: 0, right: 30))
        
        setStartInterviewButton()
        containerView.addSubview(startInterviewButton)
        startInterviewButton.constraint(top: infoStackView.bottomAnchor,
                                        leading: containerView.leadingAnchor,
                                        bottom: containerView.bottomAnchor,
                                        trailing: containerView.trailingAnchor,
                                        padding: UIEdgeInsets(top: 20, left: 18, bottom: 20, right: 18))
        
        containerView.addSubview(loadingView)
        loadingView.constraint(top: self.topAnchor,
                               leading: self.leadingAnchor,
                               bottom: self.bottomAnchor,
                               trailing: self.trailingAnchor)
    }
    
    private func setStartInterviewButton() {
        startInterviewButton.addTarget(self, action:  #selector(didTapStartInterviewButton), for: .touchUpInside)
    }
    
    private func setsystemPrompt(category: String) {
        self.systemPrompt = """
                             지금부터 당신은 Software Engineer를 뽑기 위해 면접장에 나온 면접관 역할입니다.
                             다음 주제 내에서 랜덤하게 한국어로 창의적인 질문을 해주십시오. \(category)
                             어려운 질문을 주셔도 괜찮습니다. 질문을 구체적으로 해주세요.
                             질문은 무조건 "질문: (~~)"과 같은 양식으로 해주십시오. 질문 외에 다른 말은 하지 마세요. 질문을 하시고 답변을 기다리십시오.
                             
                             제가 답변을 한 후에 답변을 평가해주십시오.
                             두가지 평가 기준이 있습니다. 우선 제가 질문에 맞는 답을 했는지 확인을 해야합니다. 그리고 구체적인 정도에 따라 0~10 사이의 점수로 평가해주십시오.
                             만약 답변이 틀렸거나 모르겠다고 답한 경우 0점을 주십시오. 특히 답변이 질문과 상관없는 내용인 경우 무조건 0점을 주십시오.
                             또한 역으로 질문을 하는 경우나, 질문과 다른 주제의 답변을 한 경우에도 0점을 주십시오.
                             그리고 점수와 함께 해당 점수를 준 이유와 개선할 부분, 만점 답변 예시를 알려주세요.
                             답변은 무조건 "점수: (숫자만)
                             해당 점수를 준 이유와 개선할 부분: (~~)
                             만점 답변 예시: (~~)"
                             와 같은 양식으로 해주십시오. 답변 외에 다른 말은 하지 마세요.
                             """
        let prompt: [String : String] = ["role": "system", "content": self.systemPrompt]
        chatHistory.append(prompt)
    }
    
    // MARK: - @objc Method
    
    @objc
    func didTapStartInterviewButton() {
        self.loadingView.isLoading = true
        setsystemPrompt(category: self.selectCategory)
        ChatGPTNetworkManager.shared.postChatMesseage {
            self.delegate?.startInterviewButtonTapped()
            self.loadingView.isLoading = false
            self.removeFromSuperview()
        }
        NotificationCenter.default.post(name: NSNotification.Name.interviewCount, object: nil)
    }
}
