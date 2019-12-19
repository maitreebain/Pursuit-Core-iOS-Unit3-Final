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
            DispatchQueue.main.async {
                self.favoritesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        
        ElementsAPIClient.getFavorites { (result) in
            
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let favElements):
                self.elements = favElements.filter {($0.favoritedBy?.contains("Mai"))!}
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController,
            let indexPath = favoritesTableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let selectedFav = elements[indexPath.row]
        
        detailVC.elements = selectedFav
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? ElementCell else {
            fatalError("could not conform to ElementCell")
        }
        
        let selectedFavorite = elements[indexPath.row]
        
        cell.configureCell(for: selectedFavorite)
        
        return cell
    }
}
