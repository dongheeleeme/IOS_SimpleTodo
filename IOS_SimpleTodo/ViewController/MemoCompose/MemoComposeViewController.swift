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
    
    var addHandler: ((Memo) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let content = contentView.text, content.count > 0 else {
            let controller = UIAlertController(title: "알림", message: "메모를 입력해주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            return
        }
        
        let memo = Memo(content: content, date: Date())
        addHandler?(memo)
        dismiss(dismiss(animated: true, completion: nil))
    }
}
