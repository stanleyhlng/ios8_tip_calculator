//
//  SettingsViewController.swift
//  ios8_tip_calculator
//
//  Created by Stanley Ng on 9/6/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        var percentages = [0.1, 0.15, 0.2]
        var percentage = percentages[tipControl.selectedSegmentIndex]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(String(format: "%f", percentage), forKey: "tip_percentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
