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
        NavigationView{
            ScrollView{
                VStack{
                   
                    let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
                    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
                   
                    
                    
                    let line = Legend(color: .secondary, label: "Выручка", order: 5)
                    
                    let mediana = DataPoint(value: 99, label: "109к", legend: line)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "пн", legend: warmUp),
                        .init(value: 90, label: "вт", legend: warmUp),
                        .init(value: 91, label: "ср", legend: warmUp),
                        .init(value: 92, label: "чт", legend: warmUp),
                        .init(value: 130, label: "пт", legend: warmUp),
                        .init(value: 124, label: "сб", legend: warmUp),
                        .init(value: 102, label: "вс", legend: fatBurning),
                    ]

                    BarChartView(dataPoints: points, limit: mediana)
                }
            
            .navigationTitle("Cтатистика")
            }
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

