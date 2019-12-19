//
//  DetailViewController.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var favoriteBarButton: UIBarButtonItem!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    var elements: ElementsDataLoad?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        
        guard let element = elements else {
            print("could not conform to elements")
            return
        }
        
        detailTextView.text = "Symbol: \(element.symbol)\nNumber: \(element.number)\nWeight: \(element.atomic_mass ?? 0.0)\nMelting Point: \(element.melt ?? 0.0)\nBoiling Point: \(element.molar_heat ?? 0.0)\nDiscovered by: \(element.discovered_by ?? "Not Found")"
        

        let link = "http://images-of-elements.com/\(element.name.lowercased()).jpg"
        
        detailImage.getImage(for: link) { (result) in
            
            switch result {
            case .failure(let appError):
                print("image could not be found \(appError)")
                DispatchQueue.main.async {
                    self.detailImage.image = UIImage(systemName: "xmark")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailImage.image = image
                }
            }
        }
    }

    @IBAction func favorited(_ sender: UIBarButtonItem) {
        
        sender.isEnabled = false
        
        guard let element = elements else {
            print("did not conform to elements")
            return
        }
        
        let addedFavorite = ElementsDataLoad(name: element.name, atomic_mass: element.atomic_mass, symbol: element.symbol, number: element.number, melt: element.melt, molar_heat: element.molar_heat, discovered_by: element.discovered_by, favoritedBy: "Mai")
        
        ElementsAPIClient.postFavorites(favorite: addedFavorite) { [weak self] (result) in
            
            switch result {
                case .failure(let appError):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Failed to Post", message: "\(appError)")
                        sender.isEnabled = true
                    }
                case .success:
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Favorite added!", message: "\(addedFavorite.name) added to your favorites")
                }
            }
        }
    }
    
}
