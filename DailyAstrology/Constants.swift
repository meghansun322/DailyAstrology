//
//  Constants.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/20/23.
//

import Foundation
import SwiftUI

struct Constants {
                 
    static let GET_HOROSCOPE_BTN = "~ Get My Horoscope ~"
    static let PICK_HOROSCOPE_MESSAGE = "Pick Your Zodiac Sign:"
    static let SIGN_DATE = [
        "aries": "Mar 21 - Apr 19",
        "taurus": "Apr 20 - May 20",
        "gemini": "May 21 - Jun 20",
        "cancer": "Jun 21 - Jul 22",
        "leo": "Jul 23 - Aug 22",
        "virgo": "Sep 23 - Oct 22",
        "libra": "Sep 23 - Oct 22",
        "scorpio": "Oct 23 - Nov 21",
        "sagittarius": "Nov 22 - Dec 21",
        "capricorn": "Dec 22 - Jan 19",
        "aquarius": "Jan 20 - Feb 18",
        "pisces": "Feb 19 - Mar 20"]
    
    struct Default {
        static let SELECTION = ""
        static let DAY = "today"
        
    }
    struct Gradient {
        static let COLORS = [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.1137254902, blue: 0.7490196078, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.9215686275, blue: 0.8509803922, alpha: 1))]
        static let END = UnitPoint(x: 1, y: 1)
        static let START = UnitPoint(x: 0, y: 0)
    }
    
    struct Horoscope {
        static let COLOR_TITLE = "Color"
        static let COMPATIBILITY_TITLE = "Compatibility"
        static let DESCRIPTION_TITLE = "Description"
        static let LUCKY_NUM_TITLE = "Lucky Number"
        static let LUCKY_TIME_TITLE = "Lucky Time"
        static let MOOD_TITLE = "Mood"
        
    }
    
    struct Params {
        static let SIGN = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
        static let DAY: [String] = ["yesterday", "today", "tomorrow"]
    }
   
}
