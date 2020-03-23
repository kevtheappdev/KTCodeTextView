//
//  CodeTextField.swift
//  CodeTextField
//
//  Created by Kevin Turner on 3/22/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import UIKit

class KTCodeTextView: UITextView {
    private var codeTextContainer = KTSyntaxTextStorage()
    
    override var textStorage: NSTextStorage {
        return codeTextContainer
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    private func highlight(Text text: String) -> NSAttributedString {
        return NSAttributedString()
    }
    
    @objc func textChanged() {
        self.attributedText = highlight(Text: self.text)
    }
    
}
