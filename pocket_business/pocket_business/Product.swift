//
//  Product.swift
//  pocket_business
//
//  Created by 18177231 on 21.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let cost: Double
    let amount: Int
    let expirationDate: String
}
