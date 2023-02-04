//
//  nasaPicture.swift
//  apod_ios
//
//  Created by Eleftherios Pournos-Georgiou on 4/2/23.
//

import Foundation

struct NasaPicture: Decodable{
    let date: String
    let title: String
    let url: String
    let explanation: String
}
