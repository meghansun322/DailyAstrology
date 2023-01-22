//
//  HoroscopeViewModel.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import Foundation

class HoroscopeViewModel: ObservableObject {
    
    @Published var model: Horoscope
    @Published var showingDate: String // default is "today" (shows horoscope for today)
    
    var horoscopeSet: [String: Horoscope] // [DAY_PARAM: HOROSCOPE]
    
    // Constructor takes in Horoscope dictionary and default set model to "today"
    init(horoscopeSet: [String: Horoscope]){
        self.horoscopeSet = horoscopeSet
        self.model = horoscopeSet[Constants.Default.DAY]!
        self.showingDate = Constants.Default.DAY
    }
    
    var date_range: String {
        return model.date_range
    }
    
    var current_date: String {
        return model.current_date
    }
    
    var description: String {
        return model.description
    }
    
    var compatibility: String {
        return model.compatibility
    }
    
    var mood: String {
        return model.mood
    }
    
    var color: String {
        return model.color
    }
    
    var lucky_number: String {
        return model.lucky_number
    }
    
    var lucky_time: String {
        return model.lucky_time
    }
    
    // Used to switch between horoscope readings of DAY PARAMS
    func switchDate(date: String) {
        self.model = horoscopeSet[date]!
        self.showingDate = date
   
    }
    
}
