//
//  ClockViewController.swift
//  todayWidgetDemo
//
//  Created by Christina Moulton on 2015-05-21.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
  var timeLabel: UILabel?
  
  var timer: NSTimer?
  let INTERVAL_SECONDS = 0.2
  
  var dateFormatter = NSDateFormatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set up date formatter since it's expensive to keep creating them
    self.dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
    self.dateFormatter.timeStyle = NSDateFormatterStyle.FullStyle
    
    // create and add label to display time
    timeLabel = UILabel(frame: self.view.frame)
    updateTimeLabel(nil) // to initialize the time displayed
    // style the label a little: multiple lines, center, large text
    timeLabel?.numberOfLines = 0 // allow it to wrap on to multiple lines if needed
    timeLabel?.textAlignment = .Center
    timeLabel?.font = UIFont.systemFontOfSize(28.0)
    self.view.addSubview(timeLabel!)
    
    // Timer will tick ever 1/5 of a second to tell the label to update the display time
    timer = NSTimer.scheduledTimerWithTimeInterval(INTERVAL_SECONDS, target: self, selector: "updateTimeLabel:", userInfo: nil, repeats: true)
  }
  
  func updateTimeLabel(timer: NSTimer!) {
    if let label = timeLabel {
      // get the current time
      let now = NSDate.new()
      // convert time to a string for display
      label.text = dateFormatter.stringFromDate(now)
    }
  }

}

