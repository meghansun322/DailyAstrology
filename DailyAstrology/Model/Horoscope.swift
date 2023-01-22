//
//  Horoscope.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import Foundation

struct Horoscope: Codable {
    
    var date_range: String
    var current_date: String
    var description: String
    var compatibility: String
    var mood: String
    var color: String
    var lucky_number: String
    var lucky_time: String
 
}

extension Horoscope {
    static let horoscopeList_example: [String: Horoscope] = [
        "yesterday": Horoscope(date_range: "Mar 21 - Apr 20", current_date: "January 19, 2023", description: "You're known for your special concern about family and friends, and today's no exception. Well, there is one little difference. Right now, you've got some pretty crazy ideas about how to make them happy. Go for it!", compatibility: "Sorpio", mood: "Thoughful", color: "Blue", lucky_number: "50", lucky_time: "11pm"),
        
        "today" : Horoscope(date_range: "Mar 21 - Apr 20", current_date: "January 20, 2023", description: "You're known for your special concern about family and friends, and today's no exception. Well, there is one little difference. Right now, you've got some pretty crazy ideas about how to make them happy. Go for it!", compatibility: "Sorpio", mood: "Thoughful", color: "Blue", lucky_number: "50", lucky_time: "11pm"),
        
        "tomorrow": Horoscope(date_range: "Mar 21 - Apr 20", current_date: "January 21, 2023", description: "You're known for your special concern about family and friends, and today's no exception. Well, there is one little difference. Right now, you've got some pretty crazy ideas about how to make them happy. Go for it!", compatibility: "Sorpio", mood: "Thoughful", color: "Blue", lucky_number: "50", lucky_time: "11pm")
                              
    ]
                              
    static let horoscope_example:  Horoscope = Horoscope(date_range: "Mar 21 - Apr 20", current_date: "January 19, 2023", description: "You're known for your special concern about family and friends, and today's no exception. Well, there is one little difference. Right now, you've got some pretty crazy ideas about how to make them happy. Go for it!", compatibility: "Sorpio", mood: "Thoughful", color: "Blue", lucky_number: "50", lucky_time: "11pm")
}
