//
//  About.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/11/24.
//

import Foundation
import SwiftUI

import SwiftUI

struct About: View {
    @ObservedObject var coreComponents:CoreGameComponent
    @Environment(\.presentationMode) var presentationMode
    @State private var showGreetAlert = false
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack(spacing:0){
                        Text("A")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        Text("bout ")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                        Text("M")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        Text("yself")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(1)
                }
                
                VStack{
                    Text("Hi! My name is Yi Ling, thank you for playing my game!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("I got this idea from the game Kingdom Come Deliverance, where you can go to the inn in Sasau to play farkle with the gambler there. The game is set in the Kingdom of Bohemia in 1403, when Sigismund, King of Hungary, invaded with his HRE allies and a huge Cuman horde.")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("I'm a history lover. I like making mods for historical games like those of Paradox Interactive. It's just wonderful when you can simulate history with the mechanisms you youself developed and programmed.")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("Enjoy the sweet peacefulness of Sasau! Glory to Sir Albert Farkle of Iceland, who invented the game back in 14th century!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .multilineTextAlignment(.leading)
                
                VStack{
                    Image("photo")
                        .resizable()
                        .padding()
                }
                
                Button(action:{
                    showGreetAlert.toggle()
                }){
                    Text("||")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Maximilian", size: 30))
                        .multilineTextAlignment(.leading)
                    HStack(spacing:0){
                        Text("W")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 30))
                            .multilineTextAlignment(.leading)
                        Text("ish ")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Maximilian", size: 20))
                            .multilineTextAlignment(.leading)
                        Text("Y")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 30))
                            .multilineTextAlignment(.leading)
                        Text("ou ")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Maximilian", size: 20))
                            .multilineTextAlignment(.leading)
                        
                        Text("a ")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Maximilian", size: 20))
                            .multilineTextAlignment(.leading)

                        Text("H")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 30))
                            .multilineTextAlignment(.leading)
                        Text("appy ")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Maximilian", size: 20))
                            .multilineTextAlignment(.leading)
                        Text("D")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 30))
                            .multilineTextAlignment(.leading)
                        Text("ay!")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Maximilian", size: 20))
                            .multilineTextAlignment(.leading)
                    }
                    .alert(isPresented: $showGreetAlert){
                        Alert(title: Text("Thank you!"), message: Text("Good day to you too!"), dismissButton: .default(Text("God Bless You!")))
                    }
                    
                    Text("||")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Maximilian", size: 30))
                        .multilineTextAlignment(.leading)
                }
                
            }
            .padding()
            
            Button("||  Back to Main Screen  ||"){
                coreComponents.state = 0
                presentationMode.wrappedValue.dismiss()
            }
            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
            .foregroundColor(Color.black)
        }
    }
}

#Preview {
    farkleGame()
}
