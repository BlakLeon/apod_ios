//
//  networkService.swift
//  apod_ios
//
//  Created by Eleftherios Pournos-Georgiou on 4/2/23.
//

import Foundation
import Alamofire

class NetworkService{
    
    typealias ApiClosurePicture = (Result<NasaPicture, Error>) -> ()
    typealias ApiClosurePictures = (Result<[NasaPicture], Error>) -> ()
    
    private let apiKey = "bMWhLzksrEsKwVABDJsmfvHJSZ3Qarrbs1mZTASJ"
    private var apiUrl: URL?{
        URL(string: "https://api.nasa.gov/planetary/apod")
    }
    
    private var defaultParams: [String: Any]{
        ["api_key": apiKey]
    }
    
     func fetchTodaysImage(completion :ApiClosurePicture?) {
        guard let apiUrl = apiUrl else{
            return
        }
                
         AF.request(apiUrl, method: .get, parameters: defaultParams)
             .validate()
            .responseDecodable(of: NasaPicture.self, queue: .main) { response in
           switch response.result{
           case .success(let picture): completion?(.success(picture))
           case .failure(let error): completion?(.failure(error))
           }
        }
    }
    func fetchImagen(from:Date? = nil,to: Date? = nil, completion: ApiClosurePictures?){
        guard let apiUrl = apiUrl else{
            return
        }
        var params = defaultParams
        if let fromDate = from {
            params["end_date"] = fromDate.toYYYYMMDD
        }
        if let toDate = to {
            params["start_date"] = toDate.toYYYYMMDD
                   }
        AF.request(apiUrl, method: .get, parameters: defaultParams)
            .validate()
           .responseDecodable(of: [NasaPicture].self, queue: .main) { response in
          switch response.result{
          case .success(let pictures): completion?(.success(pictures))
          case .failure(let error): completion?(.failure(error))
          }
       }
    }
    
    
    
    
}
