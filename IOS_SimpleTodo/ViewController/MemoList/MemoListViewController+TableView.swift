//
//  MemoListViewController+TableView.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/20.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import UIKit

extension MemoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }

        return memoCell
    }
}

extension MemoListViewController: UITableViewDelegate {
    
}
