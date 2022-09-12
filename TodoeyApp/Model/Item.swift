//
//  Item.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 13/09/22.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    // here its reverse relationship, we defined it via linking objects where property is the value of item formed via forwrad relationship
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
