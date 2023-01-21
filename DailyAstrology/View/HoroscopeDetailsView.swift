//
//  HoroscopeDetailsView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import SwiftUI

struct HoroscopeDetailsView: View {
    
    // default date to show
    @State var showingDate = Constants.Default.DAY
    @State var horoscopeList: [String: Horoscope]
    @State var selectedSign: String
   
    
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
            DateButtonView(showingDate: $showingDate, date: Constants.Params.DAY[0])
            Spacer()
            DateButtonView(showingDate: $showingDate, date: Constants.Params.DAY[1])
            Spacer()
            DateButtonView(showingDate: $showingDate, date: Constants.Params.DAY[2])
            Spacer()
        }
    }
    
    var horoscopeSections: some View {
        VStack(alignment: .leading) {
            Text(horoscopeList[showingDate]!.current_date)
                .padding(.bottom, 10)
            // Description
            HoroscopeSectionView(title: Constants.Horoscope.DESCRIPTION_TITLE, text: horoscopeList[showingDate]!.description)
            // Compatibility
            HoroscopeSectionView(title: Constants.Horoscope.COMPATIBILITY_TITLE, text: horoscopeList[showingDate]!.compatibility)
            // Mood
            HoroscopeSectionView(title:  Constants.Horoscope.MOOD_TITLE, text: horoscopeList[showingDate]!.mood)
            // Color
            HoroscopeSectionView(title: Constants.Horoscope.COLOR_TITLE, text: horoscopeList[showingDate]!.color)
            // Lucky Number
            HoroscopeSectionView(title:  Constants.Horoscope.LUCKY_NUM_TITLE, text: horoscopeList[showingDate]!.lucky_number)
            // Lucky Time
            HoroscopeSectionView(title:  Constants.Horoscope.LUCKY_TIME_TITLE, text: horoscopeList[showingDate]!.lucky_time)
        }
        
    }
    
    var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: Constants.Gradient.COLORS), startPoint: Constants.Gradient.START, endPoint: Constants.Gradient.END)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HoroscopeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeDetailsView(horoscopeList: Horoscope.horoscopeList_example, selectedSign: "Aries")
    }
}

struct DateButtonView: View {
    @Binding var showingDate: String
    var date: String
    
    var body: some View {
        Button(date.capitalized){
            showingDate = date.lowercased()
        }
        .foregroundColor(showingDate == date.lowercased() ? Color("light-gray") : .white)
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



