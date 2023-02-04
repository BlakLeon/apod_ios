//
//  networkService.swift
//  apod_ios
//
//  Created by Eleftherios Pournos-Georgiou on 4/2/23.
//

import Foundation
import Alamofire

class NetworkService{
    private let apiKey = "bMWhLzksrEsKwVABDJsmfvHJSZ3Qarrbs1mZTASJ"
    
    function fetchTodaysImage() {
        AF.request("https://api.nasa.gov/planetary/apod").response { response in
            debugPrint(response)
        }
    }
}
