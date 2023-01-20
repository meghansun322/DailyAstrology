//
//  HoroscopeViewModel.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import Foundation

class HoroscopeViewModel: ObservableObject {
    
    @Published var model: Horoscope
    
    init(horoscope: Horoscope){
        self.model = horoscope
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
}
