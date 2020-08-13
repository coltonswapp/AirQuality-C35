//
//  CBSCityListViewController.swift
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSCityListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var state: String?
    var country: String?
    var cities: [String] = [] {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        guard let state = state,
        let country = country
        else { return }
        
        CBSAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities = cities {
                self.cities = cities
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? CBSCityDetailViewController else { return }
            let city = cities[indexPath.row]
            destinationVC.city = city
            destinationVC.state = state
            destinationVC.country = country
        }
    }
    
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CBSCityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
    
    
}
