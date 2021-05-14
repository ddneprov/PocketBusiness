//
//  Employee.swift
//  pocket_business
//
//  Created by 18177231 on 14.05.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

struct Employee: Codable{
    let id: Int
    let name: String
    let position: String
    let salary: Double
    let tax: Double
    let salaryWithTax: Double
    let phoneNumber: String
}
