//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Junor on 16/3/10.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController {
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultKey) as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultKey) }
    }
    
    struct History {
        static let SegueID = "Show Diagnostice History"
        static let DefaultKey = "History.info"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueID:
                if let textVC = segue.destinationViewController as? TextViewController {
                    if let ppc = textVC.popoverPresentationController {
                        ppc.delegate = self
                    }
                    textVC.text = "\(diagnosticHistory)"
                    print("history = \(diagnosticHistory)")
                }
            default: break
            }
        }
    }
}


extension DiagnosedHappinessViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
}

