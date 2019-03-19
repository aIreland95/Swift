//
//  ViewController.swift
//  5DayHourlyForecast
//
//  Created by Aaron on 1/31/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variable declarations
    private let forecastService = ForecastService()
    private var forecast = ForecastList.init(list: [], city: nil, cod: nil, message: nil, count: nil)
    
    // variables for the textField and data table
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var forecastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.dataSource = self
        
        }
    
    // action function for the search button, retrieves the forecasts of the city that is typed in by the user
    @IBAction func searchButton(_ sender: Any) {
        
        let city = cityTextField.text
        
        forecastService.retrieveForecasts(value: city) { (forecast) in
            
            guard let forecast = forecast else {return}
            self.forecast = forecast
            self.forecastTableView.reloadData() // <- this reloadData() statement causes a thread issue
        }
        //self.forecastTableView.reloadData() // <- this reloadData() does not cause a thread issue, but Search has to be pressed twice
    }
}

// extension for providing the data to the tableView
extension ViewController: UITableViewDataSource {
    
    // function that returns the number of cells based on the count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.forecast.list.count
    }

    // function that sets the cell labels to the appropriate date and temperature values
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = forecastTableView.dequeueReusableCell(withIdentifier: "forecastTableViewCell", for: indexPath) as! ForecastTableViewCell
        
        // collects the data from the forecast.list's indexPath.row
        let data = forecast.list[indexPath.row]
        
        // DateFormatter settings and implimentation
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // sets the cells text to the date value and temperature values
        cell.dateTimeLabel.text = "\(dateFormatter.string(from: data.date))"
        cell.highLowLabel.text = "\(String(describing: data.main.tempMax))° / \(String(describing: data.main.tempMin))°"
        
        return cell
    }
}
