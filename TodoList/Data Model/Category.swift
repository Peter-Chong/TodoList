//
//  Category.swift
//  TodoList
//
//  Created by Weng Liang Chong on 29/10/2019.
//  Copyright © 2019 Weng Liang Chong. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
