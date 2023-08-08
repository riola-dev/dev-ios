//
//  AnswerViewController.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/08/02.
//

import UIKit

// MARK: - AnswerType

enum EntryPoint {
    case interviewAnswer
    case resultDatail
}

// MARK: - AnswerViewController

final class AnswerViewController: BaseViewController {
    
    // MARK: - Property
    
    private var scoreComponent = ""
    private var reasonAndImprovementComponent = ""
    private var perfectScoreExampleComponent = ""
    private let entryPoint: EntryPoint
    
    // MARK: - view
    
    private lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private lazy var contentView = {
        $0.axis = .vertical
        $0.spacing = 40
        $0.distribution = .fill
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 34, left: 16.0, bottom: 34, right: 16.0)
        return $0
    }(UIStackView(arrangedSubviews:[headerStack,userAnswerView, LineView(color: .gray03), scoreView,
                                    LineView(color: .gray03), assistantAnswerView,guideToSaveImageView,
                                    bottomButtonStack]))
    
    private let pageIndicatorLabel: UILabel = {
        $0.font = .setFont(.content01Bold)
        $0.text = ""
        $0.textColor = .gray01
        return $0
    }(UILabel())
    
    private var questionLabel: BasicLabel = {
        $0.numberOfLines = 0
        return $0
    }(BasicLabel(contentText: StringLiteral.exampleQuestion,
                 fontStyle: .largeTitle01,
                 textColorInfo: .white))
    
    private lazy var headerStack = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fill
        return $0
    }(UIStackView(arrangedSubviews:[pageIndicatorLabel, questionLabel]))
    
    private lazy var userAnswerView = AnswerStackView(type: .user, text: "")
    private lazy var scoreView = AnswerStackView(type: .score, text: "", score: 10)
    private lazy var assistantAnswerView = AnswerStackView(type: .assistant, text: "")
    
    private let guideToSaveImageView = GuideView(guideText: StringLiteral.guideToSaveImage)
    
    // TODO: 이미지 저장
    private lazy var saveImageButton: MainButton = {
        let action = UIAction { [weak self] _ in
        }
        $0.setTitle(StringLiteral.saveImageButton, for: .normal)
        $0.isActivated = true
        return $0
    }(MainButton())
    
    private lazy var nextQuestionButton: MainButton = {
        let action = UIAction { [weak self] _ in
            if chatHistory.count >= ChatCountLiteral.MAXIMUM_CHAT_COUNT {
                let resultVC = DevterviewResultViewController()
                self?.navigationController?.pushViewController(resultVC, animated: true)
            } else {
                let questionVC = QuestionViewController()
                self?.navigationController?.pushViewController(questionVC, animated: true)
            }
        }
        if chatHistory.count >= ChatCountLiteral.MAXIMUM_CHAT_COUNT {
            $0.setTitle(StringLiteral.checkResult, for: .normal)
        } else {
            $0.setTitle(StringLiteral.nextQuestionButton, for: .normal)
        }
        $0.addAction(action, for: .touchUpInside)
        $0.isActivated = true
        return $0
    }(MainButton())
    
    private lazy var bottomButtonStack = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
        $0.constraint(.heightAnchor, constant: 60)
        return $0
    }(UIStackView(arrangedSubviews: [saveImageButton, nextQuestionButton]))
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        switch entryPoint {
        case .interviewAnswer:
            self.setLabelText()
            self.setupLayout()
            self.parsingAnswerFromResponse()
            self.saveInterviewData()
        case .resultDatail:
            self.setupLayout()
        }

        
        print("🥹🥹🥹🥹\(interviewHistory)🥹🥹🥹🥹")
    }
    
    // MARK: - Init
    
    init(entryPoint: EntryPoint) {
        self.entryPoint = entryPoint
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - method
    
    private func attribute() {
        self.setNavigationInlineTitle(title: "뎁터뷰")
        self.setSendErrorMailButton()
        self.navigationController?.navigationBar.tintColor = .white
        switch entryPoint {
        case .interviewAnswer:
            self.setCustomBackButton(type: .goToMainVC)
        case .resultDatail:
            self.setCustomBackButton(type: .goToPreviousVC)
        }
    }
    
    private func setLabelText() {
        self.pageIndicatorLabel.text = String(((chatHistory.count - 4) / ChatCountLiteral.CHAT_CYCLE_COUNT + 1)) + "/5"
        self.questionLabel.text = chatHistory[chatHistory.count - 4]["content"]
        self.userAnswerView.answerLabel.text = chatHistory[chatHistory.count - 3]["content"]
    }
    
    private func setupLayout() {
        self.view.addSubview(scrollView)
        scrollView.constraint(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        setSaveImageButton()
        self.scrollView.addSubview(contentView)
        contentView.constraint(top: scrollView.contentLayoutGuide.topAnchor,
                               leading: scrollView.contentLayoutGuide.leadingAnchor,
                               bottom: scrollView.contentLayoutGuide.bottomAnchor,
                               trailing: scrollView.contentLayoutGuide.trailingAnchor)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func configureResultDatail(interviewQuestion: String,
                               userAnswer: String,
                               userAnswerScore: Int,
                               userAnswerScoreReason: String,
                               perfectScoreExampleAnswer: String) {
        
        self.questionLabel.text = interviewQuestion
        self.userAnswerView.answerLabel.text = userAnswer
        self.scoreView.scoreLabel.text = String(userAnswerScore) + "점"
        self.scoreView.answerLabel.text = userAnswerScoreReason
        self.assistantAnswerView.answerLabel.text = perfectScoreExampleAnswer
    }
    
    private func saveInterviewData() {
        interviewHistory.append(InterviewData(interviewQuestion: chatHistory[chatHistory.count - 4]["content"] ?? "",
                                              userAnswer: chatHistory[chatHistory.count - 3]["content"] ?? "",
                                              userAnswerScore: Int(scoreComponent) ?? 0 ,
                                              userAnswerScoreReason: reasonAndImprovementComponent,
                                              perfectScoreExampleAnswer: perfectScoreExampleComponent))
    }
    
    private func setSaveImageButton() {
        saveImageButton.addTarget(self, action: #selector(saveAnswerViewImage), for: .touchUpInside)
    }
    
    private func parsingAnswerFromResponse() {
        let answer = chatHistory[chatHistory.count - 2]["content"]
        if let components = answer?.components(separatedBy: "\n") {
            
            if components.count >= 3 {
                self.scoreComponent = components[0].replacingOccurrences(of: "점수: ", with: "")
                self.reasonAndImprovementComponent = components[1].replacingOccurrences(of: "해당 점수를 준 이유와 개선할 부분: ", with: "")
                for i in 2...components.count - 1 {
                    if i == 2 {
                        let text = components[i].replacingOccurrences(of: "만점 답변 예시: ", with: "")
                        perfectScoreExampleComponent.append(text)
                    } else {
                        let text = " " + components[i].replacingOccurrences(of: "만점 답변 예시: ", with: "")
                        perfectScoreExampleComponent.append(text)
                    }
                }
                
                self.scoreView.scoreLabel.text = scoreComponent + "점"
                self.scoreView.answerLabel.text = reasonAndImprovementComponent
                self.assistantAnswerView.answerLabel.text = perfectScoreExampleComponent
                
            } else {
                print("올바르지 않은 형태의 답변을 받았습니다.")
            }
        }
    }
    
    // MARK: - @objc method
    
    @objc
    private func saveAnswerViewImage() {
        guard let image = contentView.transfromToImage() else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        showOneButtonAlert(title: "이미지 저장 완료", message: "이미지가 갤러리에 저장되었습니다.")
    }
    
}

