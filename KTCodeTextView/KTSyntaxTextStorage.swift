//
//  KTHighlightingSyntaxTextStorage.swift
//  KTCodeTextView
//
//  Created by Kevin Turner on 3/23/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import UIKit

class KTSyntaxTextStorage: NSTextStorage {
    let imp = NSMutableAttributedString()
    let syntaxHighlighter = KTPythonHighlighter()
    
    override var string: String {
        return imp.string
    }
    
    override init() {
        super.init()
    }
    
    override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key : Any] {
        return imp.attributes(at: location, effectiveRange: range)
    }
    
    override func replaceCharacters(in range: NSRange, with str: String) {
        imp.replaceCharacters(in: range, with: str)
        self.edited(.editedCharacters, range: range, changeInLength: str.count - range.length)
    }
    
    override func setAttributes(_ attrs: [NSAttributedString.Key : Any]?, range: NSRange) {
        imp.setAttributes(attrs, range: range)
        self.edited(.editedAttributes, range: range, changeInLength: 0)
    }
    
    override func processEditing() {
        super.processEditing()
        // remove previous higlights
        self.removeAttribute(.foregroundColor, range: self.editedRange)
        
        let highlights = syntaxHighlighter.generateHighlights(forText: self.string)
        for highlight in highlights {
            self.addAttribute(.foregroundColor, value: highlight.color, range: highlight.range)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
