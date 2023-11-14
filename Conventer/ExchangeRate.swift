//
//  ExchangeRate.swift
//  Conventer
//
//  Created by Matko Mihalj on 08.11.2023..
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String
    var body: some View {
        HStack{
            // left currency
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // Exchange rate text
            Text(text)
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
        .previewLayout(.sizeThatFits)
}
