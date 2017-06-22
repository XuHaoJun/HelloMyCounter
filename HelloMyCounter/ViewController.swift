//
//  ViewController.swift
//  HelloMyCounter
//
//  Created by fguai on 2017/6/22.
//  Copyright © 2017年 xuhaojun. All rights reserved.
//

import UIKit
import SwiftMoment

let locale = Locale(identifier: "zh-tw")

class ViewController: UIViewController {

    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var adultCountLable: UILabel!
    @IBOutlet weak var childCountLabel: UILabel!
    
    var adultDates = [Date]()
    var childDates = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        adultCountLable.text = "0"
        childCountLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func adlutBtnPress(_ sender: Any) {
        let now = Date()
        adultDates.append(now)
        adultCountLable.text = "\(adultDates.count)"
    }
    
    @IBAction func childBtnPress(_ sender: Any) {
        let now = Date()
        childDates.append(now)
        childCountLabel.text = "\(childDates.count)"
    }
    
    func dateToLocalTimeString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from:date)
    }
    
    @IBAction func historyBtnPress(_ sender: Any) {
        var logText = ""
        logText = "＊ 小孩進場時間：\n"
        for date in childDates {
            logText = "\(logText)\(dateToLocalTimeString(date: date))\n"
        }
        logText = "\(logText)\n"
        logText = "\(logText)＊ 大人進場時間：\n"
        for date in adultDates {
            logText = "\(logText)\(moment(date).fromNow())\n"
        }
        logTextView.text = logText
    }
}

