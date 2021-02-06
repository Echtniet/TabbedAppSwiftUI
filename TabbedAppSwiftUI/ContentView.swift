//
//  ContentView.swift
//  TabbedAppSwiftUI
//
//  Created by student on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var showModal = false
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso", "lasso"]
    
    init() {
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                
                Spacer()
                    .fullScreenCover(isPresented: $showModal, content: {
                        Button(action: {
                            showModal.toggle()
                        }, label: {
                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        })
                    })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("On tab: 1")
                            .navigationTitle("Tab 1")
                    }
                    
                default:
                    NavigationView {
                        Text("On tab: \(selectedIndex)")
                            .navigationTitle("Tab \(selectedIndex)")
                    }
                }
            }
            
            Spacer()
            
            Divider()
                .padding(.bottom, 16)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        if num == 2 {
                            showModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 48, weight:. bold))
                                .foregroundColor(.red)
                            Spacer()
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight:. bold))
                                .foregroundColor(selectedIndex == num ? .black : .gray)
                            Spacer()
                        }
                        
                    })
                    
                }
            }
        }
    }
}
/*
TabView {
    Text("First")
        .tabItem {
            Image(systemName: "person")
            Text("First")
        }
    Text("Second")
        .tabItem {
            Image(systemName: "gear")
            Text("Second")
        }
}
*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
