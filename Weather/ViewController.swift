//
//  ViewController.swift
//  Weather
//
//  Created by Derek Jensen on 4/15/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var txtCityAndState: UITextField!
    @IBOutlet weak var lblCityAndState: UILabel!
    
    @IBAction func clickedSetDefault(sender: UIButton) {
        let value = txtCityAndState.text
        lblCityAndState.text = value
        
        let defaults = NSUserDefaults(suiteName: "group.com.kreatived.weather")
        
        defaults?.setValue(value, forKey: "currentCityAndState")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults(suiteName: "group.com.kreative.weather")
        
        let currentCityAndState: AnyObject? = defaults?.valueForKey("currentCityAndState")
        
        if currentCityAndState != nil {
            lblCityAndState.text = currentCityAndState as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

