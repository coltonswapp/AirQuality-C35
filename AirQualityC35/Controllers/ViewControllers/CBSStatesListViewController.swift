//
//  CBSStatesListViewController.swift
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSStatesListViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    var country: String?
    var states: [String] = [] {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
         guard let country = country else { return }
        CBSAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            if let states = states {
                self.states = states
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? CBSCityListViewController else { return }
            let state = states[indexPath.row]
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

extension CBSStatesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = states[indexPath.row]
        
        cell.textLabel?.text = state
        
        return cell
    }
    
}

