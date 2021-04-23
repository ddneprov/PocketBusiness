//
//  Sale.swift
//  pocket_business
//
//  Created by 18177231 on 23.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

struct Sale: Codable {    
    let id: Int
    let products: String
    let amounts: String
    let costs: String
    let names: String
    let costsWithTax: String
    let date: String
    let totalCost: Double
    let totalCostWithTax: Double
}
