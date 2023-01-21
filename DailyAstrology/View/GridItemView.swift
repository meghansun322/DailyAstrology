//
//  GridItemView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/21/23.
//

import SwiftUI


struct GridItemView:View {
    var sign: String
 
    @Binding var selection: String
    @ObservedObject var vm: HoroscopesViewModel
    
    var body: some View {
        Button(action: {
            selection = sign
            vm.getHoroscopes(sign: selection)
        }, label: {
            VStack{
               
                Text(sign.capitalized)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text(Constants.SIGN_DATE[sign]!)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        })
        .frame(width: 105, height: 105)
        .background(selection == sign ? Color("selected-sign"): Color("clear"))
        .clipShape(Rectangle())
        .cornerRadius(10)
    }
}
