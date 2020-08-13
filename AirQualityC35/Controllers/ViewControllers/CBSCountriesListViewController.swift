//
//  CBSCountriesListViewController.swift
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSCountriesListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var countriesTableView: UITableView!
    
    
    // MARK: - Properties
    
    var countries: [String] = [] {
        didSet {
            updateViews()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        CBSAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries{
                self.countries = countries
            }
        }
        
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatesVC" {
            guard let indexPath = countriesTableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? CBSStatesListViewController else { return }
            
            let selectedCountry = countries[indexPath.row]
            destinationVC.country = selectedCountry
        }
    }
    
    // MARK: - Class Method
    func updateViews() {
        DispatchQueue.main.async {
            self.countriesTableView.reloadData()
        }
    }

} // End of class


extension CBSCountriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
        
        return cell
    }
    
    
}
