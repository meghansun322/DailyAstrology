//
//  ContentView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HoroscopesViewModel()
    @State private var selection = Constants.DEFAULT_SIGN
  
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Text(Constants.PICK_HOROSCOPE_MESSAGE)
                
                Picker("Select a sign", selection: $selection) {
                    ForEach(Constants.SIGN_PARAMS, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: selection) { value in
                    vm.getHoroscopes(sign: selection)
                }
                
                NavigationLink {
                    HoroscopeDetailsView(horoscopeList: vm.horoscopeList)
                } label : {
                    Text(Constants.GET_HOROSCOPE_BTN)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
