//
//  ContentView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HoroscopesViewModel()
    @State private var selection = Constants.default_sign
  
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Text("Pick your Zodiac Sign:")
                Picker("Select a paint color", selection: $selection) {
                    ForEach(Constants.sign_params, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: selection) { value in
                    vm.getHoroscopes(sign: selection)
                }
                
                NavigationLink {
                    HoroscopeDetailsView(horoscopeList: vm.horoscopeList)
                } label : {
                    Text("Get my horoscope!")
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
