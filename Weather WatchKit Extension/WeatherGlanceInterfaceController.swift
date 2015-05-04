//
//  WeatherGlanceInterfaceController.swift
//  Weather
//
//  Created by Derek Jensen on 4/15/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import Foundation
import CoreLocation
import WatchKit

class WeatherGlanceInterfaceController : WKInterfaceController {
    
    @IBOutlet weak var txtLocation: WKInterfaceLabel!
    @IBOutlet weak var txtTemperature: WKInterfaceLabel!
    @IBOutlet weak var txtCondition: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let weatherHelper = WeatherHelper()
        
//        WKInterfaceController.openParentApplication(["request": "location"], reply: {(replyinfo, error) -> Void in
//            
//            if(error != nil) {
//                println(error)
//            }else {
//                let cityAndState = (replyinfo?["location"] as? String)!
//                
//                if(cityAndState != "") {
//                    let weather = weatherHelper.getWeather(cityAndState)
//                    
//                    self.txtLocation.setText(weather.location)
//                    self.txtTemperature.setText(weather.temperature)
//                    self.txtCondition.setText(weather.condition)
//                }else {
//                    self.txtLocation.setText("Unknown")
//                    self.txtTemperature.setText("No Data")
//                    self.txtCondition.setText("")
//                }
//            }
//        
//        })
        
        let group = "group.com.kreatived.weather"
        
        let defaults = NSUserDefaults(suiteName: group)
        
        let cityAndState = defaults?.valueForKey("currentCityAndState") as? String
        
        if((cityAndState) != nil) {
            let weather = weatherHelper.getWeather(cityAndState!)
            
            self.txtLocation.setText(weather.location)
            self.txtTemperature.setText(weather.temperature)
            self.txtCondition.setText(weather.condition)
        }else {
            self.txtLocation.setText("Unknown")
            self.txtTemperature.setText("No Data")
            self.txtCondition.setText("")
        }
    }
}