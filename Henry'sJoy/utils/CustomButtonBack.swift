//
//  CustomButtonBack.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/13/24.
//

import Foundation
import SwiftUI

struct CustomButtonBack: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action:{
            presentationMode.wrappedValue.dismiss()
        }){
            Text("<  ")
                .foregroundColor(Color.black)
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
            Text("Back")
                .foregroundColor(Color.black)
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
        }
        .navigationBarBackButtonHidden(true)
    }
}
