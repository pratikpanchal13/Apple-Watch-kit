//
//  ScheduleInterfaceController.swift
//  AirAber
//
//  Created by indianic on 24/03/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var flightsTable: WKInterfaceTable!
    
    
    var flights = Flight.allFlights()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightsTable.numberOfRows {
            if let controller = flightsTable.rowController(at: index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let flight = flights[rowIndex]
        presentController(withName: "Flight", context: flight)
    }
    
    
    /*
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
 
 */

}
