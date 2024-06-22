//
//  ViewController.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let repository: BakeriesRepository
    
    init(repository: BakeriesRepository) {
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
                let data = try await repository.getBakeryList(query: .init(
                    sortingOption: .default,
                    personalFilter: false,
                    isHard: true,
                    isDessert: false,
                    isBrunch: false,
                    pageNumber: 1
                ))
                dump(data)
            }
            catch {
                dump(error)
            }
        }
    }


}

