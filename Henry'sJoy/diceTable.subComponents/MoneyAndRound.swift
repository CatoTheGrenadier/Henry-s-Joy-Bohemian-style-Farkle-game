//
//  moneyAndRound.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

struct moneyAndRound: View {
    @ObservedObject var coreComponents = CoreGameComponent()
    var body: some View {
        Text("Round \(((coreComponents.round + 1) - (coreComponents.round + 1) % 2) / 2)")
    }
}

#Preview {
    farkleGame()
}
