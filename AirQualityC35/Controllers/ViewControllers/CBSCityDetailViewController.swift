//
//  CBSCityDetailViewController.swift
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSCityDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    @IBOutlet weak var aQILabel: UILabel!
    
    
    // MARK: - Properties
    var state: String?
    var country: String?
    var city: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let city = city,
        let state = state,
        let country = country
        else { return }

        CBSAirQualityController.fetchDataforCity(city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    
    func updateViews(with details: CBSCityAirQuality) {
        DispatchQueue.main.async {
            self.cityLabel.text = details.city
            self.stateLabel.text = details.state
            self.countryLabel.text = details.country
            self.temperatureLabel.text = "\(details.weather.temperature) C"
            self.humidityLabel.text = "\(details.weather.humidity)"
            self.windspeedLabel.text = "\(details.weather.windspeed)MPH"
            self.aQILabel.text = "\(details.pollution.airQualityIndex)"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
