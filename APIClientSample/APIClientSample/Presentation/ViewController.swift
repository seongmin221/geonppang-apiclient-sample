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
        
        let apiclient = APIClient()
        let request = SignInRequest()
        var cancelBag: Set<AnyCancellable> = []
        
        URLSession.shared.dataTask(with: apiclient.createRequest(with: request)) { data, response, error in
            dump(response)
        }
        .resume()
        
//        apiclient.send(request)
//            .sink(receiveCompletion: { completion in
//                print("Completion received: \(completion)")
//            }, receiveValue: { response in
//                dump(response)
//            })
//            .store(in: &cancelBag)
    }


}

