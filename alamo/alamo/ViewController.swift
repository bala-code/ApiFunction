//
//  ViewController.swift
//  alamo
//
//  Created by user165007 on 3/6/20.
//  Copyright © 2020 user165007. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = Service(baseUrl: "https://http://restcountries.eu/rest/v2")
        service.getAllCountryNameFrom(endPoint: "all")
        
    }


}

