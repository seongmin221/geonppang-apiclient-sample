//
//  ViewController.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import UIKit
import Combine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = BestBakeryListClient()
        let request = BestBakeryListRequest()
        
        Task { 
            do {
                let request = try await client.send(request)
                dump(request)
            } catch {
                print("Error")
            }
        }
        
    }


}
