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
        ZStack{
            Image("Cover")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if coreComponents.state == 0{
                    if coreComponents.round != 0{
                        VStack(spacing:0){
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
                            
                            diceTable(coreComponents: coreComponents)
                        }
                    }else{
                            VStack(){
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
                                
                                diceTable(coreComponents: coreComponents)
                        }
                    }
                    if coreComponents.round == 0{
                        Button("||  Rules  ||"){
                            coreComponents.state = 1
                            dummy.toggle()
                        }
                        .padding(10)
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                        .foregroundColor(Color.black)
                        
                        Button("||  About  ||"){
                            coreComponents.state = 2
                            dummy.toggle()
                        }
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                        .foregroundColor(Color.black)
                    }
                }else if coreComponents.state == 1{
                    Rules(coreComponents: coreComponents)
                }else{
                    About(coreComponents: coreComponents)
                }
            }
        }
    }
}

#Preview {
    farkleGame()
}
