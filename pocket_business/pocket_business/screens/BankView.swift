//
//  BankView.swift
//  pocket_business
//
//  Created by 18177231 on 24.04.2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import Foundation
import SwiftUI

struct BankView: View {
    var body: some View {
       
      
        
        ScrollView{

            HStack{
                
                Spacer()
                Spacer()
                Image(systemName: "arrow.uturn.backward.circle.fill").resizable()
                    .frame(width: 32.0, height: 32.0).padding(.trailing, 20)

            }
            
            VStack {
                Text("1 200 000 ₽").font(.system(.largeTitle, design: .rounded))
                Text("чистые активы").font(.system(.title3, design: .rounded))
            }.frame(width: 400, height: 150)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .opacity(0.2))
            .cornerRadius(10)
            .fixedSize()
                
            
            
            
            HStack {
                Text("Товары").padding(10)
                Spacer()
                Text("400к").padding(10)
            }
            
            HStack {
                Text("Долги нам").padding(10)
                Spacer()
                Text("20к").padding(10)
            }
            
            HStack {
                Text("Долги наши").padding(10)
                Spacer()
                Text("0к").padding(10)
            }
            
            HStack {
                Text("Оклады").padding(10)
                Spacer()
                Text("140к").padding(10)
            }
        }
    }
}
