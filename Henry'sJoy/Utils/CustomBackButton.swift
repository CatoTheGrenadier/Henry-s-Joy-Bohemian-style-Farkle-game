//
//  CustomBackButton.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/13/24.
//

import Foundation
import SwiftUI

struct CustomBackButton: View{
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action:{
            dismiss()
        }){
            HStack{
                Text("<  ")
                    .foregroundColor(Color.black)
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 23))
                Text("B")
                    .foregroundColor(Color.red)
                    .font(Font.custom("Maximilian", size: 25))
                +
                Text("ack")
                    .foregroundColor(Color.black)
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 25))
            }
        }
    }
}

#Preview {
    farkleGame()
}
