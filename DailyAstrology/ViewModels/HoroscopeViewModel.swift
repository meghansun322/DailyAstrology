//
//  HoroscopeViewModel.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import Foundation
import SwiftUI


class HoroscopeViewModel: ObservableObject {
    @Published var sign: String = ""
    @Published var day: String = ""
    @Published var horoscope: Horoscope?
    
    func getHoroscope(sign: String, day: String) {
        AstroService().postRequest(sign: sign, day: day, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.horoscope = response
                case .failure (let error):
                    print("Aw no, an error has occured \(error)")
                }
            }
        })
    }
}
