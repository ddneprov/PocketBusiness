//
//  Utils.swift
//  pocket_business
//
//  Created by 18177231 on 21.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation

public class Utils{
    
    func getDate() -> String{
        let date = Date()
        let format = DateFormatter()
        format.locale = Locale(identifier: "ru_RU")
        format.dateFormat = "dd, EEEE"
        return format.string(from: date)
    }
    
    
    func parseJSONtoProduct(data: String) -> [Product]? {
        
        var returnValue: [Product]?
        let jsonData = Data(data.utf8)
        
        do {
            returnValue = try JSONDecoder().decode([Product].self, from: jsonData)
        } catch {
            print("Error took place\(error.localizedDescription).")
        }
        
        return returnValue
    }
    
}

