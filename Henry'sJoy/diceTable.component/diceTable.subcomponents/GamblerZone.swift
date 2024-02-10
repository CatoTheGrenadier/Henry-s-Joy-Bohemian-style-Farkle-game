//
//  Gambler Zone.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/10/24.
//

import Foundation
import SwiftUI

struct GamblerView: View {
    @ObservedObject var coreComponents = CoreGameComponent()
    @State private var dummy: Bool = false
    
    var body: some View {
        Text("This is my round")
        .onAppear(){
            Text("Ai is playing")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                coreComponents.aiPlay(p: coreComponents.Gambler)
            }
        }
    }
}

#Preview {
    farkleGame()
}
