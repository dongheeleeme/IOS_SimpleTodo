//
//  MemoComposeViewController.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/20.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {

    @IBOutlet weak var contentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
    }
}
