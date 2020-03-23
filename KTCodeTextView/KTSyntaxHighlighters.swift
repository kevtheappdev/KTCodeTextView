//
//  KTLexicalAnalyzers.swift
//  KTCodeTextView
//
//  Created by Kevin Turner on 3/23/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import Foundation
import UIKit


struct Highlight {
    var range: NSRange
    var color: UIColor
}

protocol KTHighlighter {
    func generateHighlights(forText text: String) -> [Highlight]
}

class KTPythonHighlighter: KTHighlighter {
    static let keywordsStr = "def try except do while for if elif else in is or pass global from finally del not nonlocal lambda return with yield"
    
    var literals = ["[0-9]+", "False", "True", "None"]
    var strLiterals = ["'.*'", "\".*\""] // TODO: check this shit over, also multiline strings doe
    
    var keywords: [String] {
        return KTPythonHighlighter.keywordsStr.components(separatedBy: " ")
    }
    
    var theme: KTSyntaxTheme
    
    
    init(theme: KTSyntaxTheme = BasicTheme()) {
        self.theme = theme
    }
    
    func generateHighlights(forText text: String) -> [Highlight] {
        var result: [Highlight] = []
        
        // keywords
        for keyword in keywords {
            result.append(contentsOf: KTPythonHighlighter.generateHighlights(withPattern: "\(keyword)\\s+", inText: text, withColor: self.theme.color(forType: .keyword)))
        }

        // literals
        for literal in literals {
            result.append(contentsOf: KTPythonHighlighter.generateHighlights(withPattern: literal, inText: text, withColor: self.theme.color(forType: .numLiteral)))
        }
        
        // strLiterals
        for literal in strLiterals {
            result.append(contentsOf: KTPythonHighlighter.generateHighlights(withPattern: literal, inText: text, withColor: self.theme.color(forType: .stringLiteral)))
        }
        
        
        return result
    }
    
    
    static func generateHighlights(withPattern pattern: String, inText text: String, withColor color: UIColor) -> [Highlight]{
        var result: [Highlight] = []
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators)
        let nsrange = NSRange(text.startIndex..<text.endIndex, in: text)
        let matches = regex?.matches(in: text, options: [], range: nsrange) ?? []
        for match in matches {
            result.append(Highlight(range: match.range, color: color))
        }
        
        return result
    }

    
}
