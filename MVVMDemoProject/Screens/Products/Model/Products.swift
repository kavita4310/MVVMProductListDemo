//
//  Products.swift
//  MVVMDemoProject
//
//  Created by kavita chauhan on 24/01/24.
//

import Foundation

struct ProductsData:Decodable {
    let id:Int
    let title:String
    let price:Float
    let description:String
    let category:String
    let image:String
    let rating:Ratings
}
struct Ratings:Decodable {
    let rate:Float
    let count:Int
}
