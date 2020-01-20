//
//  MemoListViewController.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/17.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    private func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addMemo(_ sender: Any) {
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: "MemoComposeViewController") as? UINavigationController,
            let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            present(naviVC, animated: true, completion: nil)
        }
    }
}
