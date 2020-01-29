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
        loadAll()
    }
    
    private func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addMemo(_ sender: Any) {
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: MemoComposeViewController.reuseIdentifier) as? UINavigationController,
            let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            
            composeVC.addHandler = { memo in
                self.memos.insert(memo, at: 0)
                self.saveAll()
                self.tableView.reloadData()
            }

            present(naviVC, animated: true, completion: nil)
        }
    }
    
    private func saveAll() {
        let data = memosToDicMapper(memos: self.memos)
        
        userDefaultTransaction { userDefaults in
            userDefaults.set(data, forKey: UserDefaultsKey.memoList)
        }
    }
    
    private func loadAll() {
        
        let userDefaults = UserDefaults.standard
        guard let memos = userDefaults.object(forKey: UserDefaultsKey.memoList) as? [[String : Any]] else { return }
        
        self.memos = memos.map { memo in
            Memo(
                content: memo["content"] as? String ?? "",
                date: memo["insertDate"] as? Date ?? Date()
            )
        }
        
        tableView.reloadData()
    }
    
    private func memosToDicMapper(memos: [Memo]) -> [[String : Any]] {
        return memos.map { memo in
            [
                "content" : memo.content,
                "insertDate" : memo.date
            ]
        }
    }
    
    private func userDefaultTransaction(job: (UserDefaults) -> Void) {
        let userDefaults = UserDefaults.standard
        job(userDefaults)
        userDefaults.synchronize()
    }
}

extension MemoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: MemoCell.reuseIdentifier, for: indexPath) as? MemoCell else { return UITableViewCell() }
        
        memoCell.configure(with: self.memos[indexPath.row])

        return memoCell
    }
}

extension MemoListViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let memoDetailVC = storyboard?.instantiateViewController(withIdentifier: MemoDetailViewController.reuseIdentifier) as? MemoDetailViewController {
            memoDetailVC.configure(memo: self.memos[indexPath.row], indexPath: indexPath)
            memoDetailVC.editHandler = { memo, indexPath in
                self.memos[indexPath.row] = memo
                let data = self.memosToDicMapper(memos: self.memos)
                self.userDefaultTransaction { userDefaults in
                    userDefaults.set(data, forKey: UserDefaultsKey.memoList)
                }
                self.tableView.reloadData()
            }
            memoDetailVC.deleteHandler = { indexPath in
                self.memos.remove(at: indexPath.row)
                tableView.reloadData()
                let data = self.memosToDicMapper(memos: self.memos)
                self.userDefaultTransaction { userDefaults in
                    userDefaults.set(data, forKey: UserDefaultsKey.memoList)
                }
            }
            navigationController?.pushViewController(memoDetailVC, animated: true)
        }
    }
}

//extension UIView {
//
//    var reuseIdentifier: String {
//
//        return String(describing: self)
//    }
//}
