//
//  ViewController.swift
//  Psychologist
//
//  Created by Junor on 16/3/10.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("Nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController
        if let naviVC = destination as? UINavigationController {
            destination = naviVC.visibleViewController!
        }
        
        if let happinessVC = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Sad": happinessVC.happiness = 0
                case "Happy": happinessVC.happiness = 100
                case "Nothing": happinessVC.happiness = 75
                default: happinessVC.happiness = 50
                }
            }
        }
    }

}

