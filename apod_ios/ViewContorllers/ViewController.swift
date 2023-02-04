//
//  ViewController.swift
//  apod_ios
//
//  Created by Eleftherios Pournos-Georgiou on 4/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    let network = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.blue
        
        fetchTodaysImagen()
    }
    
    
    private func fetchTodaysImagen(){
        network.fetchTodaysImage(){ result in
            switch result {
            case .success(let picture): print(picture)
            case .failure(let error):
                let alertController = UIAlertController(title: "Error", message: error.asAFError?.errorDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(action)
                self.present(alertController, animated: true)
            }
        }
    }
}


