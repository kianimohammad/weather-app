//
//  ViewController.swift
//  weather app
//
//  Created by Mohammad Kiani on 2020-01-17.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addCity(_ sender: UIButton) {
        cities?.append(cityTxt.text!)
    }
    
}

