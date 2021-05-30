//
//  PeopleView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI





struct PeopleView: View {
    
    @State private var date = Date()

    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .opacity(0.2))
                            .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(10)
                    .accentColor(.red)
                    
                    
                    
                    
                    
                
                }.navigationTitle("Сотрудники")
            }
        }
    }
}
