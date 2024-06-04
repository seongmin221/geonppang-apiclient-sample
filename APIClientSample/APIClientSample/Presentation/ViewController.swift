//
//  ViewController.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiclient = APIClient<BestEndpoint>()
        Task {
            do {
                let data = try await apiclient.send(.getBestBakeries)
                
            } catch {
                dump(error)
            }
        }
    }


}

