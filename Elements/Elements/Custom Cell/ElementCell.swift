//
//  ElementCell.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet weak var elementImage: UIImageView!
    
    @IBOutlet weak var elementName: UILabel!
    
    @IBOutlet weak var elementMass: UILabel!
    
    var link = "http://www.theodoregray.com/periodictable/Tiles//s7.JPG"
    
    func configureCell(for element: ElementsDataLoad) {
        
        
        elementName.text = element.name
        elementMass.text = "\(element.symbol): \(element.number) Mass: \(element.atomic_mass!)"
        
        link = "http://www.theodoregray.com/periodictable/Tiles/\(element.number)/s7.JPG"
        var newNum = "0"
        
        if element.number.description.count < 2{
            newNum.append(contentsOf: "0\(element.number)")
            link = "http://www.theodoregray.com/periodictable/Tiles/\(newNum)/s7.JPG"
        } else if element.number.description.count < 3 {
            newNum.append(contentsOf: "\(element.number)")
            link = "http://www.theodoregray.com/periodictable/Tiles/\(newNum)/s7.JPG"
        } else {
            newNum = element.number.description
            link = "http://www.theodoregray.com/periodictable/Tiles/\(newNum)/s7.JPG"
        }
        
        
        
        elementImage.getImage(for: link) { [weak self] (result) in
            
            
            switch result {
            case .failure(let appError):
                print("pictures not loaded \(appError)")
                DispatchQueue.main.async {
                    self?.elementImage.image = UIImage(systemName: "xmark")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementImage.image = image
                }
            }
        }
    }
}
