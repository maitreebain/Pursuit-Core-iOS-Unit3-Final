//
//  ElementsAPIClient.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementsAPIClient {
    
    static func getElements(completion: @escaping (Result<[ElementsDataLoad], AppError>) -> ()) {
        
        let elementsEndpoint = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: elementsEndpoint) else {
            completion(.failure(.badURL(elementsEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do {
                    let elements = try JSONDecoder().decode([ElementsDataLoad].self, from: data)
                    
                    completion(.success(elements))
                }
                catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
   
    
    //get images here 
}
