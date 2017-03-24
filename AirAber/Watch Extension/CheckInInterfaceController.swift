//
//  CheckInInterfaceController.swift
//  AirAber
//
//  Created by indianic on 24/03/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

class CheckInInterfaceController: WKInterfaceController {

    
    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    
    
    var flight: Flight? {
        didSet {
            if let flight = flight {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
            }
        }
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let flight = context as? Flight { self.flight = flight }
    }
    
    
    @IBAction func checkInButtonTapped() {
        // 1
        let duration = 0.35
//        let delay = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64((duration + 0.15) * Double(NSEC_PER_SEC)))
        
//        var dispatchTime: dispatch_time_t = DispatchTime.now(dispatch_time_t(DISPATCH_TIME_NOW), Int64(0.1 * Double(NSEC_PER_SEC)))
       
//        let delay = dispatch_time(DispatchTime.now(dispatch_time_t(DISPATCH_TIME_NOW)), Int64((duration + 0.15) * Double(NSEC_PER_SEC)))

        // 2
        backgroundGroup.setBackgroundImageNamed("Progress")
        // 3
        backgroundGroup.startAnimatingWithImages(in: NSRange(location: 0, length: 10), duration: duration, repeatCount: 1)
        // 4
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            // your code here
            
            self.flight?.checkedIn = true
            self.dismiss()
        }
        
        
//        dispatch_after(delay, DispatchQueue.main) { () -> Void in
//            // 5
//            self.flight?.checkedIn = true
//            self.dismiss()
//        }
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
