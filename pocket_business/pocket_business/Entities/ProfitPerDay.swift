//
//  ProfitPerDay.swift
//  pocket_business
//
//  Created by 18177231 on 16.05.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

struct ProfitPerDay: Codable {
    let id: Int
    let date: String
    let cleanProfit: Double
    let totalProfit: Double
    let dayOfTheWeek: String
}
