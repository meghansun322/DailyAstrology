//
//  HoroscopeDetailsView.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import SwiftUI

struct HoroscopeDetailsView: View {
    
    // default date to show
    @State var showingDate = "today"
    @State var horoscopeList: [String: Horoscope]
    

    
    var body: some View {
        
        
        VStack {
           
            Text(horoscopeList[showingDate]!.current_date)
            Text(horoscopeList[showingDate]!.description)
            
            HStack{
                Button("Yesterday"){
                    showingDate = "yesterday"
                }
                
                Button("Today"){
                    showingDate = "today"
                }
                
                Button("Tomorrow"){
                    showingDate = "tomorrow"
                }
                
            }
        }
        .padding()
    }
}

struct HoroscopeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeDetailsView(horoscopeList: Horoscope.horoscope_example)
    }
}
