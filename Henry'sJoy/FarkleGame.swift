//
//  ContentView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import SwiftUI

struct farkleGame: View {
    var body: some View {
        VStack {
            Text("Inn of Sasau")
                .font(Font.custom("Maximilian", size: 36))
            diceTable()
        }
     }
}

#Preview {
    farkleGame()
}
