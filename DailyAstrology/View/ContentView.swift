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
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    let colors = [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.1137254902, blue: 0.7490196078, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.9215686275, blue: 0.8509803922, alpha: 1))]
    var body: some View {
    
            NavigationStack{
                ZStack {
                    LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                            .edgesIgnoringSafeArea(.all)
                
                
                    VStack(alignment: .leading){
                    Text(Constants.PICK_HOROSCOPE_MESSAGE)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    
                    Picker("Select a sign", selection: $selection) {
                        ForEach(Constants.SIGN_PARAMS, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selection) { value in
                        vm.getHoroscopes(sign: selection)
                    }
                    
                    
                    NavigationLink {
                        HoroscopeDetailsView(horoscopeList: vm.horoscopeList, selectedSign: selection)
                    } label : {
                        Text(Constants.GET_HOROSCOPE_BTN)
                    }
                }
                .padding()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
