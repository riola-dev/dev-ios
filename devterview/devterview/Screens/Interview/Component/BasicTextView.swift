//
//  BasicTextView.swift
//  devterview
//
//  Created by Mijoo Kim on 2023/07/31.
//

import UIKit

final class BasicTextView: UIView {
    
    // MARK: - Property

    private let placeholder: String
    
    // MARK: - View

    private lazy var textView: UITextView = {
        let style = NSMutableParagraphStyle()
        let attributedString = NSMutableAttributedString(string: $0.text)
        style.lineSpacing = CGFloat(10)
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSRange(location: 0, length: attributedString.length)
        )
        $0.attributedText = attributedString
        
        $0.font = UIFont.setFont(.content01Light)
        $0.textColor = .white
        $0.backgroundColor = .gray03
        
        $0.isScrollEnabled = true

        $0.delegate = self
        return $0
    }(UITextView())


    private lazy var placeholderLabel: UILabel = BasicLabel(
        contentText: placeholder,
        fontStyle: .content01Light,
        textColorInfo: .gray02
    )
    
    // MARK: - Init

    init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: .zero)
        setupLayout()
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    
    private func attribute() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .gray03
    }

    private func setupLayout() {
        self.constraint(.widthAnchor, constant: BasicComponentSize.width)

        self.addSubview(textView)
        textView.constraint(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 20, left: 20, bottom:20, right: 20)
        )

        self.addSubview(placeholderLabel)
        placeholderLabel.constraint(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            padding: UIEdgeInsets(top: 22, left: 22, bottom: 0, right: 0)
        )
    }
    
    func inputText() -> String? {
        return self.textView.text == placeholder ? nil : self.textView.text
    }
    
    func configureText(with text: String?) {
        guard let text else { return }
        self.textView.text = text
        self.placeholderLabel.isHidden = true
    }
}

// MARK: - UITextViewDelegate

extension BasicTextView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.isHidden = false
        }
    }
}
