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
    
    private var memo: Memo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
    }
    
    func configure(memo: Memo) {
        self.memo = memo
    }
    
    @IBAction func pop(_ sender: Any) { navigationController?.popViewController(animated: true) }
    
    @IBAction func editMemo(_ sender: Any) {
    }
    
    @IBAction func deleteMemo(_ sender: Any) {
    }
    
    private func initTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
