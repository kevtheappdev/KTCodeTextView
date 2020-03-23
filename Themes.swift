//
//  Themes.swift
//  KTCodeTextView
//
//  Created by Kevin Turner on 3/23/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import Foundation
import UIKit

// TODO: add function call type here
enum TokenType {
    case identifier
    case keyword
    case op
    case stringLiteral
    case numLiteral
}


protocol KTSyntaxTheme {
    // TODO: add font here too
    var backgroundColor: UIColor { get }
    func color(forType type: TokenType) -> UIColor
}


class BasicTheme: KTSyntaxTheme {
    var backgroundColor: UIColor {
        return UIColor.white
    }
    
    func color(forType type: TokenType) -> UIColor {
        switch type {
            case .keyword:
                return UIColor.red
            case .numLiteral:
                return UIColor.purple
            case .stringLiteral:
                return UIColor.orange
            default:
                return UIColor.black
        }
    }
    
}
