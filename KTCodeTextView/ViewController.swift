//
//  ViewController.swift
//  CodeTextField
//
//  Created by Kevin Turner on 3/22/20.
//  Copyright © 2020 Kevin Turner. All rights reserved.
//

import UIKit
import Highlightr

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var sbTextView: KTCodeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sbTextView.delegate = self
    }


    func textViewDidChange(_ textView: UITextView) {
        print("text changed!")
    }
}

