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
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Cover")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
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
            }
        }
        .navigationBarItems(leading: CustomButtonBack())
        .navigationBarTitle("Custom Back Button", displayMode: .inline)
    }
}

#Preview {
    farkleGame()
}
