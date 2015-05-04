//
//  MapInterfaceController.swift
//  Weather
//
//  Created by Derek Jensen on 4/27/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import WatchKit
import Foundation


class MapInterfaceController: WKInterfaceController {

    @IBOutlet weak var mapLocation: WKInterfaceMap!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let coords = CLLocationCoordinate2D(latitude: 41.8369, longitude: -87.6847)
        let region = MKCoordinateRegion(center: coords, span: MKCoordinateSpanMake(10, 10))
        mapLocation.addAnnotation(coords, withPinColor: .Red)
        mapLocation.setRegion(region)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
