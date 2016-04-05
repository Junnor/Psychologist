//
//  ViewController.swift
//  Psychologist
//
//  Created by Junor on 16/3/10.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("psychologist view controller - init()")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("psychologist view controller - init(nibName)")
    }
    
    deinit {
        print("psychologist view controller - deinit()")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("psychologist view controller - awakeFromNib()")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("psychologist view controller - viewDidLoad()")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("psychologist view controller - viewWillLayoutSubviews()  ..frame = \(view.frame)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("psychologist view controller - viewDidLayoutSubviews()  ..frame = \(view.frame)")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("psychologist view controller - viewWillAppear()")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("psychologist view controller - viewDidAppear()")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("psychologist view controller - viewWillDisappear()")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("psychologist view controller - viewDidDisappear()")
    }
    
    // ------------------------------------------------------------------------
    
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("Nothing", sender: nil)
    }
    
    var i = 0
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController
        if let naviVC = destination as? UINavigationController {
            destination = naviVC.visibleViewController!
        }
        
        if let happinessVC = destination as? HappinessViewController {
            ++i
            if let identifier = segue.identifier {
                switch identifier {
                case "Sad": happinessVC.happiness = 0; happinessVC.numberOfVC = i
                case "Happy": happinessVC.happiness = 100; happinessVC.numberOfVC = i
                case "Nothing": happinessVC.happiness = 75; happinessVC.numberOfVC = i
                default: happinessVC.happiness = 50; happinessVC.numberOfVC = i
                }
            }
        }
    }

}

