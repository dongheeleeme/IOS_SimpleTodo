//
//  MemoDetailViewController.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/23.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {

//    enum CellType {
//        case content, date
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var editHandler: ((Memo, IndexPath) -> Void)?
    var deleteHandler: ((IndexPath) -> Void)?
    
    private var memo: Memo?
    private var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    func configure(memo: Memo, indexPath: IndexPath) {
        self.memo = memo
        self.indexPath = indexPath
    }
    
    @IBAction func pop(_ sender: Any) {
        guard let memo = self.memo, let indexPath = self.indexPath else { return }
        self.editHandler?(memo, indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editMemo(_ sender: Any) {
        guard let memo = self.memo else { return }
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: MemoComposeViewController.reuseIdentifier) as? UINavigationController,
            let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            
            composeVC.configure(memo: memo)
            composeVC.addHandler = { memo in
                self.memo = memo
                self.tableView.reloadData()
            }
            
            present(naviVC, animated: true, completion: nil)
       }
    }
    
    @IBAction func deleteMemo(_ sender: Any) {
        guard let indexPath = self.indexPath else { return }
        self.deleteHandler?(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    private func initTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func userDefaultTransaction(job: (UserDefaults) -> Void) {
        let userDefaults = UserDefaults.standard
        job(userDefaults)
        userDefaults.synchronize()
    }
}

extension MemoDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        switch CellType(rawValue: indexPath.row) {
//        case .content:
//        case .date:
//        }
        
        if (indexPath.row == 0) {
            guard let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as? ContentCell else { return UITableViewCell() }
            contentCell.configure(with: memo?.content ?? "")
            return contentCell
        } else {
            guard let dateCell = tableView.dequeueReusableCell(withIdentifier: DateCell.reuseIdentifier, for: indexPath) as? DateCell else { return UITableViewCell() }
            dateCell.configure(with: memo?.date ?? Date())
            return dateCell
        }
    }
}

extension MemoDetailViewController: UITableViewDelegate {
    
}
