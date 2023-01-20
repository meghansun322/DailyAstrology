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
    @Published var horoscopeList = [String: Horoscope]()
    
    func getHoroscopes(sign: String) {
        for day_param in Constants.DAY_PARAMS {
            AstroService().postRequest(sign: sign, day: day_param, completion: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        self.horoscopeList[day_param] = response
                    case .failure (let error):
                        print("Aw no, an error has occured \(error)")
                    }
                }
            })
        }
        
    }
}
