//
//  ViewController.swift
//  ios8_tip_calculator
//
//  Created by Stanley Ng on 9/5/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("0.1", forKey: "tip_percentage")
        defaults.setObject("0", forKey: "tip_percentage_index")
        defaults.synchronize()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("viewWillAppear")
        
        doCalculate()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("viewDidAppear")
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("viewWillDisppear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        println("viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doCalculate() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentage = (defaults.objectForKey("tip_percentage") as String)._bridgeToObjectiveC().doubleValue
        var tipIndex = (defaults.objectForKey("tip_percentage_index") as String)._bridgeToObjectiveC().integerValue
        println("tip %: \(tipPercentage)")
        println("idx %: \(tipIndex)")
        
        var bill = billTextField.text._bridgeToObjectiveC().doubleValue
        var tip = bill * tipPercentage
        var total = bill + tip

        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        println("onEditingChanged")
        
        doCalculate()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

