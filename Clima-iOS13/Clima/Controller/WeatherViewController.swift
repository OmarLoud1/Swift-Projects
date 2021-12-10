//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate, WeaterManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var search: UITextField!
    
   var weather = weatherManager()

    let location = CLLocationManager()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        location.requestWhenInUseAuthorization()
        location.requestLocation()
        
        search.delegate = self
        weather.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        search.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = search.text{
            weather.fetch(city: city)
        }
        search.text = ""
    }
    
    
    @IBAction func locSrch(_ sender: UIButton) {
        location.requestLocation()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type the name of a city"
            return false
        }
         
    }
    
    func didUpdateWeather(_ manager: weatherManager ,weather: WeatherModel){
        DispatchQueue.main.async {
            self.cityLabel.text = weather.city
            self.temperatureLabel.text = weather.temp
            self.conditionImageView.image = UIImage(systemName: weather.condition)
        }
       
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
   
}

extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last{
            location.stopUpdatingLocation()
            let lat = loc.coordinate.latitude
            let long = loc.coordinate.longitude
            weather.fetch(lon: long, lat: lat)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error)
    }
}
