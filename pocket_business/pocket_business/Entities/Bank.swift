//
//  Bank.swift
//  pocket_business
//
//  Created by 18177231 on 14.05.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

struct Bank: Codable {
    let id: Int
    let moneyRemaining: Double
    let products: Double
    let debtsToUs: Double
    let debtsOur: Double
    let cleanMoney: Double
}
