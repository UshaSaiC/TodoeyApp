//
//  Data.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 13/09/22.
//

import Foundation
import RealmSwift

// Object is a class that defines real model objects
class Data: Object{
    // dynamic is a declaration modifier. It tells to use dynamic dispatch over static dispatch during run time
    // if user changes value of name during run time, dynamic allows realm to update those changes in database
    // @objc tag is added as dynamic dispatch cmes from objective-c
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
