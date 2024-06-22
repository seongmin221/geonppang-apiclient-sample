//
//  ViewController.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let repository: BestRepository
    
    init(repository: BestRepository) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let data = try await repository.getBestReviews()
                dump(data)
            }
            catch {
                dump(error)
            }
        }
    }


}

