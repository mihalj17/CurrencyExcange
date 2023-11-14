//
//  ContentView.swift
//  Conventer
//
//  Created by Matko Mihalj on 08.11.2023..
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    var body: some View {
        ZStack{
            // Background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                // pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                // Currency excange text
                Text("Currency Excange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                // currency conversion section
                HStack{
                    // left conversion section
                    VStack{
                        //currency
                        HStack{
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        // Text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7).background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp){
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency){
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            
                    }
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    // right conversion section
                    VStack{
                        //currency
                        HStack{
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        // Text field
                        TextField("Amount", text: $rightAmount,onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7).background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) {
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                // info button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                }
            }
        }
        }
    
}

#Preview {
    ContentView()
}
