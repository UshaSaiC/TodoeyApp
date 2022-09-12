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
    let items = List<Item>()
}
