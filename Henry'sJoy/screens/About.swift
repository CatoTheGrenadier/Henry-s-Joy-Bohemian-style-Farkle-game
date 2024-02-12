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
    
    var body: some View {
        VStack{
            VStack{
                HStack(spacing:0){
                    Text("A")
                        .foregroundColor(Color.red)
                        .font(Font.custom("Maximilian", size: 70))
                        .multilineTextAlignment(.leading)
                    Text("bout")
                        .font(Font.custom("Maximilian", size: 40))
                        .multilineTextAlignment(.leading)
                }
                .padding(1)
            }
            
            Button("Back to Main Screen"){
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
