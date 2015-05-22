//
//  TodayViewController.swift
//  todayClockWidget
//
//  Created by Christina Moulton on 2015-05-21.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
  @IBOutlet var widgetTimeLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view from its nib.
    println("widget view did load")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
    println("widgetPerformUpdateWithCompletionHandler")
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData

    widgetTimeLabel?.text = "Still not sure"
    if let label = widgetTimeLabel
    {
      let defaults = NSUserDefaults(suiteName: "group.teakmobile.grokswift.todayWidget")
      if let timeString:String = defaults?.objectForKey("timeString") as? String
      {
        widgetTimeLabel?.text = "You last ran the main app at: " + timeString
      }
    }
    
    completionHandler(NCUpdateResult.NewData)
  }
  
}
