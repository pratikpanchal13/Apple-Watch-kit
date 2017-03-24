//
//  InterfaceController.swift
//  Counter WatchKit Extension
//
//  Created by Konstantin Koval on 13/12/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  @IBOutlet fileprivate weak var countButton: WKInterfaceButton!

  var counter: Counter
  
  override init() {
    counter = Counter()
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    counter.load()
    countButton.setTitle("\(counter.count)")
    // Configure interface objects here.
    NSLog("%@ awakeWithContext", self)
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    
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
