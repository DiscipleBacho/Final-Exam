//
//  Products.swift
//  json
//
//  Created by Bachana Sanadiradze on 05.06.22.
//

import Foundation

struct Products: Codable {
    var products: [Product]
}

struct Product: Codable {
    
    var id: Int
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    
    
}
