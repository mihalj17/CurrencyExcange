//
//  SelectCurrency.swift
//  Conventer
//
//  Created by Matko Mihalj on 08.11.2023..
//

import SwiftUI

struct SelectCurrency: View {
    @State  var gridLayout = [GridItem(),GridItem(),GridItem()]
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            // Background image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(.brown)
            VStack{
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                // Currency icons
                IconGrid(currency: $leftCurrency)
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // Currency icons
                IconGrid(currency: $rightCurrency)
                //Done button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(50)
            }
            
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
