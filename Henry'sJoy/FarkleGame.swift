//
//  ContentView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import SwiftUI

struct farkleGame: View {
    @ObservedObject var coreComponents = CoreGameComponent()
    @State private var dummy: Bool = false
    @State private var isLandscape = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Cover")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    if !(isLandscape && UIDevice.current.userInterfaceIdiom == .phone){
                        VStack {
                            VStack{
                                Spacer()
                                    .padding()
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 250)
                                
                                Text("F")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 56))
                                +
                                Text("arkler of ")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 36))
                                +
                                Text("S")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 56))
                                +
                                Text("asau")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 36))
                            }
                            .padding()
                            
                            VStack{
                                NavigationLink(destination:GameView(coreComponents: coreComponents)){
                                    Text("||  PLAY  ||")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                }
                                .padding()
                                
                                NavigationLink(destination:RulesView(coreComponents: coreComponents)){
                                    Text("||  Rules  ||")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                }
                                .padding()
                                
                                NavigationLink(destination:AboutView(coreComponents: coreComponents)){
                                    Text("||  About  ||")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                }
                            }
                        }
                    }else{
                        HStack {
                                VStack(spacing:0){
                                    Image("logo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250)
                                        .padding(.bottom, -30)
                                    
                                    VStack{
                                        
                                        Text("F")
                                            .foregroundColor(Color.red)
                                            .font(Font.custom("Maximilian", size: 46))
                                        +
                                        Text("arkler")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("Maximilian", size: 26))
                                        
                                        Text("of ")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("Maximilian", size: 26))
                                        
                                        Text("S")
                                            .foregroundColor(Color.red)
                                            .font(Font.custom("Maximilian", size: 46))
                                        +
                                        Text("asau")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("Maximilian", size: 26))
                                    }
                                    .multilineTextAlignment(.center)
                                }
                                .padding(.horizontal,90)
                            
                                VStack{
                                    NavigationLink(destination:GameView(coreComponents: coreComponents)){
                                        Text("||  PLAY  ||")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                    }
                                    .padding(.vertical,10)
                                    
                                    NavigationLink(destination:RulesView(coreComponents: coreComponents)){
                                        Text("||  Rules  ||")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                    }
                                    .padding(.vertical,10)
                                    
                                    NavigationLink(destination:AboutView(coreComponents: coreComponents)){
                                        Text("||  About  ||")
                                            .foregroundColor(Color.black)
                                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                                    }
                                    .padding(.vertical,10)
                                }
                            }
                        }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        isLandscape.toggle()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    farkleGame()
}
