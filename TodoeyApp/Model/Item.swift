//
//  Item.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 12/09/22.
//

import Foundation


// Codable means class is both encodable and decodable
class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
