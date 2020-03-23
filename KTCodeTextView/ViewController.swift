//
//  ViewController.swift
//  CodeTextField
//
//  Created by Kevin Turner on 3/22/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    let textStorage = KTSyntaxTextStorage()
    
    @IBOutlet weak var sbTextView: KTCodeTextView!
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup textview
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer()
        layoutManager.addTextContainer(textContainer)
        
        self.textView = UITextView(frame: CGRect.zero, textContainer: textContainer)
        self.textView.autocapitalizationType = .none
        self.textView.autocorrectionType = .no
        self.textView.font = UIFont.systemFont(ofSize: 20)
        self.textView.smartQuotesType = .no
        self.view.addSubview(textView)
    }
    
    override func viewDidLayoutSubviews() {
        self.textView.frame = sbTextView.frame
    }


    func textViewDidChange(_ textView: UITextView) {
        print("text changed!")
    }
}

