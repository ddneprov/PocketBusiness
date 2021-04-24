//
//  ContentView.swift
//  pocket_business
//
//  Created by 18177231 on 29/01/2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//  I'm not a swift developer, sorry for this code

import SwiftUI
import SwiftUICharts




struct ContentView: View {
    var body: some View {
        
        TabView {
            TodayView()
                     .tabItem {
                        Image(systemName: "calendar")
                        Text("Сегодня")
                      }

            TopView()
                     .tabItem {
                        Image(systemName: "arrowtriangle.up.square.fill")
                        Text("Топ")
                      }
                
            ThirdView()
                     .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Метрики")
                      }
                
            PeopleView()
                     .tabItem {
                        Image(systemName: "person.3.fill")
                        Text("Люди")
                      }
            
            BankView()
                     .tabItem {
                        Image(systemName: "rublesign.circle.fill")
                        Text("Деньги")
                      }
            }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
}
