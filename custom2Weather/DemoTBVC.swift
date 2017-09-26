//
//  DemoTBVC.swift
//  custom2Weather
//
//  Created by Hao on 9/26/17.
//  Copyright © 2017 Hao. All rights reserved.
//

import UIKit
import Foundation

class DemoTBVC: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: notificationKey, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func updateData() {
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        guard let count =  DataService.shared.weather?.forecast.forecastday.count else { return 0 }
            return count - 1
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomCell

        
        cell.dayLabel.text = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1 ].date_epoch.dayWeek()
        
        guard let maxTemp = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].day.maxtemp_c else {
            fatalError("")
        }
        cell.tempMin.text = "\(maxTemp)"
        guard let minTemp = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].day.mintemp_c else {
            fatalError("")
        }
        cell.tempMax.text = "\(minTemp)"
        
        guard let  icon = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].day.condition.icon else { fatalError("") }
        cell.iconImage.downloadedFrom(urlString: "https:\(icon)")
        
        return cell
    }
    @IBAction func buttonA() {
        tableView.reloadData()
    }

    

    
}
