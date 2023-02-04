//
//  AppExtensions.swift
//  apod_ios
//
//  Created by Eleftherios Pournos-Georgiou on 4/2/23.
//

import Foundation


extension Date{
    var toYYYYMMDD:String{
        let formatter = DateFormatter()
        formatter.dateFormat="YYYY-MM-DD"
        return formatter.string(from: self)
    }
}
