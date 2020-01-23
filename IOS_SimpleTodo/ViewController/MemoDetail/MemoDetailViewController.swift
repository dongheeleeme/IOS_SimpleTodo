//
//  MemoDetailViewController.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/23.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var memo: Memo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(memo)
        initTableView()
    }
    
    func configure(memo: Memo) {
        self.memo = memo
    }
    
    @IBAction func pop(_ sender: Any) { navigationController?.popViewController(animated: true) }
    
    private func initTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension MemoDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as? ContentCell else { return UITableViewCell() }
        guard let dateCell = tableView.dequeueReusableCell(withIdentifier: DateCell.reuseIdentifier, for: indexPath) as? DateCell else { return UITableViewCell() }
        
        return UITableViewCell()
    }
}

extension MemoDetailViewController: UITableViewDelegate {
    
}
