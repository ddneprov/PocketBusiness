//
//  ContentView.swift
//  pocket_business
//
//  Created by 18177231 on 29/01/2021.
//  Copyright © 2021 ddneprov. All rights reserved.
//  I'm not a swift developer, sorry for this code

import SwiftUI
import SwiftUICharts



struct BottomTab: View {
    var body: some View {
       
        
                    TabView{
                            TodayView()
                                     .tabItem {
                                        Image(systemName: "calendar").accentColor(.red)
                                        Text("Сегодня").accentColor(.red)
                                      }
        
                            MetricsView()
                                     .tabItem {
                                        Image(systemName: "arrowtriangle.up.square.fill").renderingMode(.template)
                                        Text("Метрики").accentColor(.red)
                                     }
        
                            PeopleView()
                                     .tabItem {
                                        Image(systemName: "person.3.fill").accentColor(.red)
                                        Text("Люди").accentColor(.red)
                                      }
        
                            BankView()
                                     .tabItem {
                                        Image(systemName: "rublesign.circle.fill").accentColor(.red)
                                        Text("Деньги").accentColor(.red)
                                      }
                        }.accentColor(.red)
    }
}
    
struct ContentView: View {
    
    @State var signInSuccess = false
    
    var body: some View {
        return Group {
            if signInSuccess {
                BottomTab()
            }
            else {
                LogIn(signInSuccess: $signInSuccess)
                //LoginFormView(signInSuccess: $signInSuccess)
            }
        }
    }
}

    struct LogIn: View {
        
        
        @State var user = ""
        @State var pass = ""
                
        @Binding var signInSuccess: Bool
        @State private var showError = false

        
        var body : some View{
//            Color.yellow.edgesIgnoringSafeArea(.all).opacity(0.4)

            ZStack {
                        Color.yellow
                        .edgesIgnoringSafeArea(.all)
                            .opacity(0.2)
                    
            
                VStack {
                     Text("Войдите в 1С «УНФ»").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                    VStack{
                        
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                                
                                Text("Почта").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                
                                HStack{
                                    
                                    TextField("введите почту", text: $user)
                                    
                                    if user != ""{
                                        
                                        Image("check").foregroundColor(Color.init(.label))
                                    }
                                    
                                }
                                
                                Divider()
                                
                            }.padding(.bottom, 15)
                            
                            VStack(alignment: .leading){
                                
                                Text("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                
                                SecureField("введите пароль", text: $pass)
                                
                                Divider()
                            }
                              
                        }.padding(.horizontal, 6)
                     
                    }.padding()
                    
                    VStack{
                        
                        Button(action: {
                                        // Your auth logic
                                        if(self.user == self.pass) {
                                            self.signInSuccess = true
                                        }
                                        else{
                                            showError = true
                                        }
                                        
                                        
                                    }) {
                            
                            
                            
                            Text("Вход").foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120).padding()
                        }.background(Color("color"))
                            .clipShape(Capsule())
                            .padding(.top, 45)
                        
                        if showError {
                            Text("Неверный логин/пароль").foregroundColor(Color.red)
                        }
                        
                        //Spacer()
                        
                        
                        Button(action: {
                                if let url = URL(string: "https://v8.1c.ru/small.biz/") {
                                    if UIApplication.shared.canOpenURL(url) {
                                        UIApplication.shared.open(url, options: [:])
                                    }
                                }
                            
                        }) {
                            Text("Подключить").foregroundColor(.gray)
                        }
                        
                    }
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

