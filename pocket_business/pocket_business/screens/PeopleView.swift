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
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("")
                    
                    HStack{
                        VStack{
                            Image("face")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(height: 200)
                            
                            Text("Иван Иванов")
                            Text("Менеджер")
                            Text("+89090334541").fontWeight(.light)
                        }
                        
                        VStack{
                            Image("face")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(height: 200)
                            
                            Text("Мария Васильева")
                            Text("Бариста")
                            Text("+89037209345").fontWeight(.light)
                        }
                    }
                    
                    Text("")
                    Text("")
                    
                    HStack{
                        VStack{
                            Image("face")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(height: 200)
                            
                            Text("Иван Иванов")
                            Text("Бариста")
                            Text("+89067241757").fontWeight(.light)
                        }
                        
                        VStack{
                            Image("face")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(height: 200)
                            
                            Text("Иван Иванов")
                            Text("Уборщица")
                            Text("+8934384951").fontWeight(.light)
                        }
                    }
                }.navigationTitle("Сотрудники")
            }
        }
    }
}
