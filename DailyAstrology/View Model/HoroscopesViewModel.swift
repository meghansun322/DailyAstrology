//
//  HoroscopeViewModel.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import Foundation
import SwiftUI


class HoroscopesViewModel: ObservableObject {
    @Published var sign: String = ""
    @Published var day: String = ""
    
    // dictionary [DAY_PARAM: HOROSCOPE] -- intialized by getHoroscopes()
    @Published var horoscopeSet = [String: Horoscope]()
    
    // post and fetches for all three day params
    func getHoroscopes(sign: String) {
        for day_param in Constants.Params.DAY {
            AstroService().postRequest(sign: sign, day: day_param, completion: { result in
                DispatchQueue.main.async { // UI changes on main thread
                    switch result {
                    case .success(let response):
                        self.horoscopeSet[day_param] = response
                    case .failure (let error):
                        print("Aw no, an error has occured \(error)")
                    }
                }
            })
        }
        
    }
}
