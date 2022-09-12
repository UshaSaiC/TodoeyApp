//
//  Category.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 13/09/22.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    // One category can have many items, its a forward relationship which is easy to define
    // List is kind of array that comes from Realm framework
    let items = List<Item>() // [Int] === Array<Int>
}
