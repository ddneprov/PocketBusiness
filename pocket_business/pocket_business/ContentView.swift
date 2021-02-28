//
//  ContentView.swift
//  pocket_business
//
//  Created by 18177231 on 29/01/2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
                    let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
                    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
                    let low = Legend(color: .gray, label: "Low", order: 1)

                    let limit = DataPoint(value: 130, label: "228", legend: fatBurning)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "1", legend: low),
                        .init(value: 90, label: "2", legend: warmUp),
                        .init(value: 91, label: "3", legend: warmUp),
                        .init(value: 92, label: "4", legend: warmUp),
                        .init(value: 130, label: "5", legend: fatBurning),
                        .init(value: 124, label: "6", legend: fatBurning),
                        .init(value: 135, label: "7", legend: fatBurning),
                        .init(value: 133, label: "8", legend: fatBurning),
                        .init(value: 136, label: "9", legend: fatBurning),
                        .init(value: 138, label: "10", legend: fatBurning),
                        .init(value: 150, label: "11", legend: buildFitness),
                        .init(value: 151, label: "12", legend: buildFitness),
                        .init(value: 150, label: "13", legend: buildFitness),
                        .init(value: 136, label: "14", legend: fatBurning),
                        .init(value: 135, label: "15", legend: fatBurning),
                        .init(value: 130, label: "16", legend: fatBurning)
                    ]

                    BarChartView(dataPoints: points, limit: limit)
                }
                VStack{
                    let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
                    let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
                    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
                    let low = Legend(color: .gray, label: "Low", order: 1)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "1", legend: low),
                        .init(value: 90, label: "2", legend: warmUp),
                        .init(value: 91, label: "3", legend: warmUp),
                        .init(value: 92, label: "4", legend: warmUp),
                        .init(value: 130, label: "5", legend: fatBurning),
                        .init(value: 124, label: "6", legend: fatBurning),
                        .init(value: 135, label: "7", legend: fatBurning),
                        .init(value: 133, label: "8", legend: fatBurning),
                        .init(value: 136, label: "9", legend: fatBurning),
                        .init(value: 138, label: "10", legend: fatBurning),
                        .init(value: 150, label: "11", legend: buildFitness),
                        .init(value: 151, label: "12", legend: buildFitness),
                        .init(value: 150, label: "13", legend: buildFitness)
                    ]

                    LineChartView(dataPoints: points)
                }
                VStack{
                    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
                    let low = Legend(color: .gray, label: "Low", order: 1)

                    let points: [DataPoint] = [
                        .init(value: 70, label: "1", legend: low),
                        .init(value: 90, label: "2", legend: warmUp),
                        .init(value: 91, label: "3", legend: warmUp),
                        .init(value: 92, label: "4", legend: warmUp)
                    ]

                    HorizontalBarChartView(dataPoints: points)
                }
            }
            .navigationTitle("Cтатистика")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
