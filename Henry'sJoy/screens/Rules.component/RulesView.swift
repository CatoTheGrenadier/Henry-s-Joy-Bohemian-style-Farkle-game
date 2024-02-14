//
//  RulesView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/13/24.
//

import Foundation
import SwiftUI

struct RulesView: View{
    @ObservedObject var coreComponents : CoreGameComponent
    
    var body: some View{
        ZStack{
                Image("Cover")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Rules(coreComponents: coreComponents)
                        .padding(.horizontal)
                }
        }
        .onAppear{coreComponents.state = 2}
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    farkleGame()
}
