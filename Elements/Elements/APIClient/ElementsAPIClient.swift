//
//  ElementsAPIClient.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

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
   
    static func getFavorites(completion: @escaping (Result<[ElementsDataLoad], AppError>) -> ()) {
        
        let favoritesEndpoint = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: favoritesEndpoint) else {
            completion(.failure(.badURL(favoritesEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                    return
                case .success(let data):
                    
                    do {
                        let favorites = try JSONDecoder().decode([ElementsDataLoad].self, from: data)
                        
                        completion(.success(favorites))
                    } catch {
                        completion(.failure(.decodingError(error)))
                    }
            }
        }
        
    }
    
    
    static func postFavorites(favorite: ElementsDataLoad, completion: @escaping (Result<Bool, AppError>) -> ()) {
        
        let favoritesEndpoint = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: favoritesEndpoint) else {
            completion(.failure(.badURL(favoritesEndpoint)))
            return
        }
        
        do {
            let data = try JSONEncoder().encode(favorite)
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = data
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                
                switch result{
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                    
                }
    }
                        
                    } catch {
                        completion(.failure(.encodingError(error)))
                    }
    }
    
    static func addElements(completion: @escaping (Result<[ElementsDataLoad], AppError>) -> ()) {
        
        let extraElements = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements_remaining"
        
        guard let url = URL(string: extraElements) else {
            completion(.failure(.badURL(extraElements)))
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
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    
    
}
