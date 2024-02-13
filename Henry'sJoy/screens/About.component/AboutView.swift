//
//  AboutView.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/13/24.
//

import Foundation
import SwiftUI

struct AboutView: View{
    @ObservedObject var coreComponents : CoreGameComponent
    
    var body: some View{
        ZStack{
            Image("Cover")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                About(coreComponents: coreComponents)
            }
        }
    }
}

#Preview {
    farkleGame()
}
