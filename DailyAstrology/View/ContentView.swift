//
//  ContentView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm = HoroscopesViewModel()
    @State private var selection = Constants.Default.SELECTION
    @State private var getMyHoroscope = false
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            
    ]
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                gradientBackground
                
                VStack(){
                    
                    selectTitle
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(Constants.Params.SIGN, id: \.self) {
                            GridItemView(sign: $0, selection: $selection, vm: vm)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    Spacer()
                    
                    getHoroscopeButton
                    
                    Spacer()
                    
                }
                .padding()
    
            }
            
        }
        
    }
    
    var getHoroscopeButton: some View {
        Button {
            getMyHoroscope.toggle()
            
        } label: {
           Text(Constants.GET_HOROSCOPE_BTN)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: 30)
        }
        .sheet(isPresented: $getMyHoroscope ){
            HoroscopeView(vm: HoroscopeViewModel(horoscopeSet: vm.horoscopeSet))
        }
        .foregroundColor(selection.isEmpty ? Color("light-gray") : .white)
        .buttonStyle(.borderedProminent)
        .tint(.purple)
        .disabled(selection.isEmpty)
        
    }
    
    var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: Constants.Gradient.COLORS), startPoint: Constants.Gradient.START, endPoint: Constants.Gradient.END)
            .edgesIgnoringSafeArea(.all)
    }
    
    var selectTitle: some View {
        Text(Constants.PICK_HOROSCOPE_MESSAGE)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding([.top, .bottom])
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GridItemView: View {
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


