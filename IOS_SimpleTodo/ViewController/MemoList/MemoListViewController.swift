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
    
    var memos: [Memo] = []
    
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
            
            composeVC.addHandler = { memo in
                self.memos.insert(memo, at: 0)
                self.tableView.reloadData()
                print(self.memos)
            }
            
            present(naviVC, animated: true, completion: nil)
        }
    }
}

extension MemoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        memoCell.configure(with: self.memos[indexPath.row])

        return memoCell
    }
}

extension MemoListViewController: UITableViewDelegate {
    
}

//extension UIView {
//
//    var reuseIdentifier: String {
//
//        return String(describing: self)
//    }
//}
