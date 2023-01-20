//
//  ContentView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var sign: String = ""
    @State var day: String = ""
    @StateObject var vm = HoroscopeViewModel()
    

    
    var body: some View {
        
        
        VStack {
           
            if (vm.horoscope != nil) {
                Text(vm.horoscope!.lucky_number)
                Text(vm.horoscope!.description)
            }
            
            Button {
                vm.getHoroscope(sign: "aries", day: "yesterday")
               
            } label: {
                Text("Get Horoscope")
              
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
