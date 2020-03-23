//
//  CodeTextField.swift
//  CodeTextField
//
//  Created by Kevin Turner on 3/22/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import UIKit
import Highlightr

class KTCodeTextField: UITextView {
    private var codeTextContainer: NSTextContainer? = nil
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    private func highlight(Text text: String) -> NSAttributedString {
        let highlightr = Highlightr()
        return highlightr?.highlight(text, as: "Swift") ?? NSAttributedString()
    }
    
    @objc func textChanged() {
        self.attributedText = highlight(Text: self.text)
    }
    
}
