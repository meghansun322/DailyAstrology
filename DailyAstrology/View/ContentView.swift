//
//  ContentView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HoroscopesViewModel()
    @State private var selection = "Aries"
    let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpius", "Sagittarius", "Capricornus", "Aquarius", "Pisces"]
    
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Text("Pick your Zodiac Sign:")
                Picker("Select a paint color", selection: $selection) {
                    ForEach(signs, id: \.self) {
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
