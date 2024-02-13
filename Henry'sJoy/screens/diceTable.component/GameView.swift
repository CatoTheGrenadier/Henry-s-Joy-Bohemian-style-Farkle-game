//
//  GameView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/13/24.
//

import Foundation
import SwiftUI

struct GameView: View{
    @ObservedObject var coreComponents : CoreGameComponent
    
    var body:some View{
        ZStack{
            Image("Cover")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
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
                ScrollView{
                    diceTable(coreComponents: coreComponents)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}


#Preview {
    farkleGame()
}
