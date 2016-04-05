//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Junor on 16/3/10.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("new vc ")
        print("-\(numberOfVC) diagnosed happiness view controller - init()")   // 初始化的小bug, 由于 sugue 前就已经初始化了
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("-\(numberOfVC) diagnosed happiness view controller - init(nibName)")
    }
    
    deinit {
        print("-\(numberOfVC) diagnosed happiness view controller - deinit()")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        print("-\(numberOfVC) diagnosed happiness view controller - awakeFromNib()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-\(numberOfVC) diagnosed happiness view controller - viewDidLoad()")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("-\(numberOfVC) diagnosed happiness view controller - viewWillLayoutSubviews() ..frame = \(view.frame)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("-\(numberOfVC) diagnosed happiness view controller - viewDidLayoutSubviews() ..frame = \(view.frame)")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("-\(numberOfVC) diagnosed happiness view controller - viewWillAppear()")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("-\(numberOfVC) diagnosed happiness view controller - viewDidAppear()")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("-\(numberOfVC) diagnosed happiness view controller - viewWillDisappear()")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("-\(numberOfVC) diagnosed happiness view controller - viewDidDisappear()")
    }
    

    // ----------------------------------------------------------------------
    
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

