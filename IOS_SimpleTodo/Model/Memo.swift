//
//  Memo.swift
//  IOS_SimpleTodo
//
//  Created by 이동희A(Lee, DongHee) on 2020/01/21.
//  Copyright © 2020 Donghee Lee. All rights reserved.
//

import Foundation

struct Memo {
    
    var content: String
    var date: Date
    
    init(content: String, date: Date) {
        self.content = content
        self.date = date
    }
}
