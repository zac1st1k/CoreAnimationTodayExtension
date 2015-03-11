//
//  ViewController.swift
//  CoreAnimationTodayExtension
//
//  Created by Zac on 11/03/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myLayer = CALayer()
        myLayer.backgroundColor = UIColor.grayColor().CGColor
        myLayer.frame = CGRectMake(10, 10, 40, 40)
        
        //set frame
        myLayer.cornerRadius = 5;
        self.view.layer.addSublayer(myLayer)
        
        //chage myLayer's position
        var myAnimation = CABasicAnimation(keyPath: "position")
        myAnimation.fromValue = NSValue(CGPoint: myLayer.position)
        var toPoint = myLayer.position
        toPoint.x += 180;
        myAnimation.toValue = NSValue(CGPoint: toPoint)
        
        //grouping animations
        var myGroup = CAAnimationGroup()
        myGroup.autoreverses = true
        myGroup.duration = 3.0;
        myGroup.animations = [myAnimation]
        myGroup.fillMode = kCAFillModeForwards
        
        myLayer.addAnimation(myGroup, forKey: "kkLayerMove")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

