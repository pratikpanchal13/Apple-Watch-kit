//
//  ActivityRingInterfaceController.swift
//  AirAber
//
//  Created by indianic on 24/03/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ActivityRingInterfaceController: WKInterfaceController {

    @IBOutlet fileprivate weak var countButton: WKInterfaceButton!

    @IBOutlet var lblNumber: WKInterfaceLabel!
    var counter: Counter
    
    
    
    var myTimer: Timer = Timer()
    var count: Int = 10
    
    func startCountdown(){
        myTimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(myUpdate), userInfo: nil, repeats: true)
        
      
    }
    
    
    func myUpdate() {
        if(count > 0) {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                //                // your code here
                self.count -= 1
                print(self.count)
                self.countButton.setTitle("\(self.count)")
                self.lblNumber.setText("\(self.count)")
                
            }
            
            
        }
        else{
            self.dismiss()
        }
        
    }
    
    func countdownReachedZero(){
        if count == 1{
            myTimer.invalidate()
            self.countButton.setTitle("\(count)")
            self.lblNumber.setText("\(count)")
        }
    }
    
    

    override init() {
        counter = Counter()
    }
   
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.countButton.setTitle("\(self.count)")
        self.lblNumber.setText("\(self.count)")
        
        let duration = 0.35
        
        self.counter.load()

      
        
        
        
        
        // Configure interface objects here.
        NSLog("%@ awakeWithContext", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        

        self.startCountdown()
//        for index in 0..<10 {
//        
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                // your code here
//                
//                self.counter.increase()
//                
//                self.countButton.setTitle("\(self.counter.count)")
//                self.lblNumber.setText("\(self.counter.count)")
//                
//            }
//        }
//        
        
        
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    @IBAction func increseCounter() {
        counter.increase()
        counter.save()
        countButton.setTitle("\(counter.count)")
    }
    
    @IBAction func resetCounter() {
        counter.reset()
        countButton.setTitle("\(counter.count)")
    }


}
