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
                        TabView {
                            TodayView()
                                     .tabItem {
                                        Image(systemName: "calendar")
                                        Text("Сегодня")
                                      }
        
                            TopView()
                                     .tabItem {
                                        Image(systemName: "arrowtriangle.up.square.fill")
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


/*
struct ContentView: View {
    @State var signInSuccess = false
    
    var body: some View {
            return Group {
                    if signInSuccess {
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
                    else {
                        LogIn()
//                        LoginFormView(signInSuccess: $signInSuccess)
                    }
                }
        

    }
}
*/

    struct LogIn: View {
        
        
        @State var user = ""
        @State var pass = ""
                
        @Binding var signInSuccess: Bool
        @State private var showError = false

        
        var body : some View{
                VStack {
                     Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                    VStack{
                        
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                                
                                Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                
                                HStack{
                                    
                                    TextField("Enter Your Username", text: $user)
                                    
                                    if user != ""{
                                        
                                        Image("check").foregroundColor(Color.init(.label))
                                    }
                                    
                                }
                                
                                Divider()
                                
                            }.padding(.bottom, 15)
                            
                            VStack(alignment: .leading){
                                
                                Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                
                                SecureField("Enter Your Password", text: $pass)
                                
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
                            
                            
                            
                            Text("Sign in").foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120).padding()
                        }.background(Color("color"))
                            .clipShape(Capsule())
                            .padding(.top, 45)
                        
                        if showError {
                            Text("Incorrect username/password").foregroundColor(Color.red)
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

