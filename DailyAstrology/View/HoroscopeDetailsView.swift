//
//  HoroscopeDetailsView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import SwiftUI

struct HoroscopeDetailsView: View {
    
    // default date to show
    @State var showingDate = Constants.DEFAULT_DAY
    @State var horoscopeList: [String: Horoscope]
    @State var selectedSign: String
    
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    let colors = [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.1137254902, blue: 0.7490196078, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.9215686275, blue: 0.8509803922, alpha: 1))]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.85)
                
                VStack(alignment: .leading) {
                    
                    Text(horoscopeList[showingDate]!.current_date)
                        .padding(.bottom, 10)
                    
                    HoroscopeSectionView(title: "Description", text: horoscopeList[showingDate]!.description)
                    
                    HoroscopeSectionView(title: "Compatibility", text: horoscopeList[showingDate]!.compatibility)
                    HoroscopeSectionView(title: "Mood", text: horoscopeList[showingDate]!.mood)
                    
                    HoroscopeSectionView(title: "Color", text: horoscopeList[showingDate]!.color)
                    
                    HoroscopeSectionView(title: "Lucky Number", text: horoscopeList[showingDate]!.lucky_number)
                    
                    HoroscopeSectionView(title: "Lucky Time", text: horoscopeList[showingDate]!.lucky_time)
                    
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        DateButtonView(showingDate: $showingDate, date: Constants.DAY_YESTERDAY)
                        
                        Spacer()
                        
                        DateButtonView(showingDate: $showingDate, date: Constants.DAY_TODAY)
                        
                        Spacer()
                        
                        DateButtonView(showingDate: $showingDate, date: Constants.DAY_TOMORROW)
                        Spacer()
                    }
                }
                .padding()
               
            }
        }
        .navigationTitle(selectedSign)
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
        Button(date){
            showingDate = date.lowercased()
        }
        .disabled(showingDate == date.lowercased())
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



