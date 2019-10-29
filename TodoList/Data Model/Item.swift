//
//  Item.swift
//  TodoList
//
//  Created by Weng Liang Chong on 29/10/2019.
//  Copyright © 2019 Weng Liang Chong. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
