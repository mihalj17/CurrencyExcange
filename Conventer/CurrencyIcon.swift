//
//  CurrencyIcon.swift
//  Conventer
//
//  Created by Matko Mihalj on 08.11.2023..
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyImage: String
    @State var currencyText: String
    var body: some View {
        ZStack{
            // Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            // Currency text
            VStack {
                Spacer()
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

#Preview {
    CurrencyIcon(currencyImage: "copperpenny", currencyText: "Coper Penny")
        .previewLayout(.sizeThatFits)
}
