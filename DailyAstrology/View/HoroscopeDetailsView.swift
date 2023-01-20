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

    
    var body: some View {
        
        
        VStack {
           
            Text(horoscopeList[showingDate]!.current_date)
            Text(horoscopeList[showingDate]!.description)
            
            Spacer()
            HStack{
                DateButtonView(showingDate: $showingDate, date: Constants.DAY_YESTERDAY)
                
                Spacer()
                
                DateButtonView(showingDate: $showingDate, date: Constants.DAY_TODAY)
                
                Spacer()
                
                DateButtonView(showingDate: $showingDate, date: Constants.DAY_TOMORROW)
                
            }
        }
        .padding()
    }
}

struct HoroscopeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeDetailsView(horoscopeList: Horoscope.horoscopeList_example)
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
