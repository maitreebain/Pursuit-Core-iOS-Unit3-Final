//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementsViewController: UIViewController {

    @IBOutlet weak var elementsTableView: UITableView!
    
    var elements = [ElementsDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                self.elementsTableView.reloadData()
            }
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    elementsTableView.dataSource = self
    elementsTableView.delegate = self
    loadData()
  }

    func loadData() {
        
        ElementsAPIClient.getElements { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let elements):
                self.elements = elements
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController,
            let indexPath = elementsTableView.indexPathForSelectedRow else {
                fatalError("could not segue")
        }
        let selectedElement = elements[indexPath.row]
        
        detailViewController.elements = selectedElement
    }

}

extension ElementsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell else {
            fatalError("cell has not conformed to ElementCell")
        }
        
        let selectedElement = elements[indexPath.row]
        
        cell.configureCell(for: selectedElement)
        
        return cell
    }
    
}
