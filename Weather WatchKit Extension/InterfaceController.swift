//
//  InterfaceController.swift
//  Weather WatchKit Extension
//
//  Created by Derek Jensen on 4/15/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var currentCityAndState = "Chicago, IL"
    
    @IBOutlet weak var txtLocation: WKInterfaceLabel!
    @IBOutlet weak var txtTemperature: WKInterfaceLabel!
    @IBOutlet weak var txtCondition: WKInterfaceLabel!
    @IBOutlet weak var btnLocation: WKInterfaceButton!
    
    let weatherHelper = WeatherHelper()
    
    @IBAction func clickedRefresh() {
        // Get the currently configured location.
        // set property = location
        
        // update all of the UI
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let weather = weatherHelper.getWeather(currentCityAndState)
        
        btnLocation.setTitle(weather.location)
        txtTemperature.setText(weather.temperature)
        txtCondition.setText(weather.condition)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        if identifier == "firstButtonAction" {
            println("You've made it!")
        }
    }
}
