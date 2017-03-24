//
//  Counter.swift
//  Counter
//
//  Created by Konstantin Koval on 13/12/14.
//  Copyright (c) 2014 Konstantin Koval. All rights reserved.
//

import Foundation

private let counterKey = "counter"
struct Counter {
  
  fileprivate (set) var count = 0
  mutating func increase() {
    count += 1
  }
  
  func save() {
    let defaults = UserDefaults.standard
    defaults.set(count, forKey: counterKey)
  }
  
  mutating func load() {
   count = UserDefaults.standard.integer(forKey: counterKey)
  }
  
  mutating func reset() {
    count = 0
    save()
  }
}
