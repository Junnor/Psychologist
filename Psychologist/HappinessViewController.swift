//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Junor on 16/3/9.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    var happiness: Int = 100 {  // happiness 0 = very sad and 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = sender.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                sender.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
        
}

extension HappinessViewController: FaceViewDataSource {
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
    
}