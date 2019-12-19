//
//  FavoritesViewController.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var elements = [ElementsDataLoad]() {
        didSet {
            self.favoritesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    

}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate
