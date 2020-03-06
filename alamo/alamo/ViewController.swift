//
//  ViewController.swift
//  alamo
//
//  Created by user165007 on 3/6/20.
//  Copyright © 2020 user165007. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblCountries: UITableView!
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblCountries.dataSource = self

        
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandler { [weak self] (countries, status, message) in
            if status {
                guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tblCountries.reloadData()
            }
            
        }
        
        
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }

func tableView(_ tabeView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{

    var cell = tabeView.dequeueReusableCell(withIdentifier: "countrycell")
    if cell == nil {
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countrycell")
        
    }
    let country = countries[indexPath.row]
    
    cell?.textLabel?.text = country.name ?? "" + (country.countryCode ?? "")
    cell?.detailTextLabel?.text = country.capital ?? ""
    return cell!
}
}
