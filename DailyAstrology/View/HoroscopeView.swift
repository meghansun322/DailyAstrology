//
//  HoroscopeView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/21/23.
//

import SwiftUI

struct HoroscopeView: View {
    @StateObject var vm: HoroscopeViewModel
    
    var body: some View {
        
        ZStack {
            gradientBackground
            
            VStack(alignment: .leading) {
                
                horoscopeSections
                
                Spacer()
                
                dateOptionBtns
            }
            .padding()
               
            }
            .foregroundColor(.white)
        }
    
    var dateOptionBtns: some View {
        HStack{
            Spacer()
            DateButtonsView(vm: vm, date: Constants.Params.DAY[0])
            Spacer()
            DateButtonsView(vm: vm, date: Constants.Params.DAY[1])
            Spacer()
            DateButtonsView(vm: vm, date: Constants.Params.DAY[2])
            Spacer()
        }
    }
    
    var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: Constants.Gradient.COLORS), startPoint: Constants.Gradient.START, endPoint: Constants.Gradient.END)
            .edgesIgnoringSafeArea(.all)
    }
    
    var horoscopeSections: some View {
        VStack (alignment: .leading){
            Text(vm.current_date)
                .padding(.bottom, 10)
            // Description
            HoroscopeSectionView(title: Constants.Horoscope.DESCRIPTION_TITLE, text: vm.description)
            // Compatibility
            HoroscopeSectionView(title: Constants.Horoscope.COMPATIBILITY_TITLE, text: vm.compatibility)
            // Mood
            HoroscopeSectionView(title:  Constants.Horoscope.MOOD_TITLE, text: vm.mood)
            // Color
            HoroscopeSectionView(title: Constants.Horoscope.COLOR_TITLE, text: vm.color)
            // Lucky Number
            HoroscopeSectionView(title:  Constants.Horoscope.LUCKY_NUM_TITLE, text: vm.lucky_number)
            // Lucky Time
            HoroscopeSectionView(title:  Constants.Horoscope.LUCKY_TIME_TITLE, text: vm.lucky_time)
        }
    }
}

struct DateButtonsView: View {
   
    @ObservedObject var vm: HoroscopeViewModel
    var date: String
    
    var body: some View {
        Button(date.capitalized){
            vm.switchDate(date: date.lowercased())
        }
        .foregroundColor(vm.showingDate == date.lowercased() ? Color("light-gray") : .white)
    }
}

struct HoroscopeSectionView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Text(text)
                .padding(.bottom, 10)
        }
        
    }
}


struct HoroscopeView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeView(vm: HoroscopeViewModel( horoscopeSet: Horoscope.horoscopeList_example))
    }
}
