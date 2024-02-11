//
//  diceTable.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

struct diceTable: View {
    @ObservedObject var coreComponents = CoreGameComponent()
    var body: some View {
        VStack{
            moneyAndRound(coreComponents: coreComponents)
                .padding(20)
            GamblerZone(coreComponents: coreComponents)
            Spacer()
            HenryZone(coreComponents:coreComponents)
        }
        .padding(5.0)
        
    }
}

#Preview {
    farkleGame()
}
