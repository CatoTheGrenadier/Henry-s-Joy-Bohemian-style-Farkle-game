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
        NavigationView{
            ZStack{
                Image("Cover")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Rules(coreComponents: coreComponents)
                        .padding(.horizontal)
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
