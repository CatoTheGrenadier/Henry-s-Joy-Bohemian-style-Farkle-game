//
//  ContentView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import SwiftUI

struct farkleGame: View {
    var coreComponents: CoreGameComponent
    init(){
        self.coreComponents = CoreGameComponent()
    }
    var body: some View {
        VStack {
            Text("Inn of Sasau")
            diceTable()
            Button("Roll Dice") {
               coreComponents.rollDice(p: coreComponents.Henry)
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    farkleGame()
}
