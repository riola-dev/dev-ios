//
//  NoticePopupViewController.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/07/28.
//

import UIKit

class NoticePopupView: UIView {
    
    // MARK: - View
    
    private let containerView: UIView = {
        $0.backgroundColor = .lightDark
        $0.layer.cornerRadius = 20
        return $0
    }(UIView())
    
    private lazy var dismissButton: UIButton = {
        $0.setImage(ImageLiteral.xmarkSymbol, for: .normal)
        $0.tintColor = .white
        let action = UIAction { [weak self] _ in
            // TODO - 팝업 닫기 기능 구현
            print("엑스버튼눌림")
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
    
    private let titleLabel = BasicLabel(contentText: "뎁터뷰 안내사항",
                                        fontStyle: .headline01Bold,
                                        textColorInfo: .white)
    
    private let subTitleLabel: BasicLabel = {
        $0.numberOfLines = 2
        $0.textAlignment = .center
        return $0
    }(BasicLabel(contentText: "뎁터뷰 시작 전에 안내 사항을 알려드려요\n아래 사항을 확인해주세요!",
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
            contentText: "뎁터뷰는 최대 5번",
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 2
            return $0
        }(BasicLabel(
            contentText: "뎁터뷰는 하루에 5번(30문제) 할 수 있어요!\n매일매일 뎁터뷰를 통해 공부해보세요",
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
            contentText: "뎁터뷰 질문은 랜덤 5개",
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 2
            return $0
        }(BasicLabel(
            contentText: "선택한 분야에서 랜덤으로 5개의 질문이 출제돼요\n만약, 질문이 이상하면 오류제보를 부탁드려요!",
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
            contentText: "뎁터뷰 이미지 저장",
            fontStyle: .content02Bold,
            textColorInfo: .white
        )
        
        let contentLabel: BasicLabel = {
            $0.numberOfLines = 0
            return $0
        }(BasicLabel(
            contentText: "계속 보고 싶은 뎁터뷰는 이미지 저장해서 계속 확인할 수 있어요.하단의 버튼을 통해 저장해주세요",
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
    
    private lazy var rejectNoticeLabelStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [rejectNoticeLabelButton, rejectNoticeLabel]))
    
    private let rejectNoticeLabelButton = CheckMarkButton()
    
    private let rejectNoticeLabel = BasicLabel(
        contentText: "안내사항 다시 보지 않기",
        fontStyle: .captionRegualr,
        textColorInfo: .white
    )
    
    private lazy var makeBandButton: MainButton = {
        $0.setTitle("뎁터뷰 시작", for: .normal)
        let action = UIAction { [weak self] _ in
            // TODO - 인터뷰 시작 화면 연결
            print("뎁터뷰 시작 버튼 눌림")
        }
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(MainButton())
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    private func attribute() {
        self.backgroundColor = .black.withAlphaComponent(0.4)
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
        
        containerView.addSubview(rejectNoticeLabelStackView)
        rejectNoticeLabelStackView.constraint(top: infoStackView.bottomAnchor,
                                              leading: containerView.leadingAnchor,
                                              padding: UIEdgeInsets(top: 50, left: 30, bottom: 0, right: 0))
        
        containerView.addSubview(makeBandButton)
        makeBandButton.constraint(top: rejectNoticeLabelStackView.bottomAnchor,
                                  leading: containerView.leadingAnchor,
                                  bottom: containerView.bottomAnchor,
                                  trailing: containerView.trailingAnchor,
                                  padding: UIEdgeInsets(top: 20, left: 18, bottom: 20, right: 18))
    }
}
