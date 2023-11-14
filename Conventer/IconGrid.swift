//
//  IconGrid.swift
//  Conventer
//
//  Created by Matko Mihalj on 09.11.2023..
//

import SwiftUI

struct IconGrid: View {
    @State  var gridLayout = [GridItem(),GridItem(),GridItem()]
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5){ number  in
                if Currency.allCases[number] == currency{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[number].rawValue, currencyText: CurrencyText.allCases[number].rawValue)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 3)
                        .opacity(0.5))
                        .shadow(color: .black, radius: 9)
            }
                else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[number].rawValue, currencyText: CurrencyText.allCases[number].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[number]
                        }
                }
            }
            
        }
        .padding([.bottom,.leading,.trailing])
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
