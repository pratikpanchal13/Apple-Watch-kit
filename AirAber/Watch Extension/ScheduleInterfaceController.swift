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
    var selectedIndex = 0
    
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
//        let flight = flights[rowIndex]
//        presentController(withName: "Flight", context: flight)
        
        selectedIndex = rowIndex
        
        let flight = flights[rowIndex]
        let controllers = ["Flight", "CheckIn",]
        presentController(withNames: controllers, contexts:[flight, flight])
    }
    
    
    override func didAppear() {
        super.didAppear()
        // 1
        if flights[selectedIndex].checkedIn, let controller = flightsTable.rowController(at: selectedIndex) as? FlightRowController {
            // 2
            animate(withDuration: 0.35, animations: { () -> Void in
                // 3
                controller.updateForCheckIn()
            })
        }
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
