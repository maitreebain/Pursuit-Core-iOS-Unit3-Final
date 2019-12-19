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
    
    func configureCell(for element: ElementsDataLoad) {
        
        elementName.text = element.name
        elementMass.text = "\(element.symbol): \(element.number) Mass: \(element.atomicMass?.description)"
    }
}
