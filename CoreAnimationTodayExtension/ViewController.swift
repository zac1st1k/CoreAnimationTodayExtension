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
        myLayer.backgroundColor = UIColor.yellowColor().CGColor
        myLayer.borderColor = UIColor.redColor().CGColor
        myLayer.borderWidth = 3.0
        myLayer.frame = CGRectMake(10, 50, 40, 40)
        
        var myLayer2 = CALayer()
        myLayer2.backgroundColor = UIColor.yellowColor().CGColor
        myLayer2.borderColor = UIColor.redColor().CGColor
        myLayer2.borderWidth = 3.0
        myLayer2.frame = CGRectMake(10, 50 * 2, 40, 40)
        
        //set frame
        myLayer.cornerRadius = 5;
        myLayer2.cornerRadius = 5;

        self.view.layer.addSublayer(myLayer)
        self.view.layer.addSublayer(myLayer2)

        
        //chage myLayer's position
        var moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = NSValue(CGPoint: myLayer.position)
        var toPoint = myLayer.position
        var screenBounds = UIScreen.mainScreen().bounds
        toPoint.x += screenBounds.width - 60;
        moveAnimation.toValue = NSValue(CGPoint: toPoint)
        
        var moveAnimation2 = CABasicAnimation(keyPath: "position")
        moveAnimation2.fromValue = NSValue(CGPoint: myLayer2.position)
        var toPoint2 = myLayer2.position
        toPoint2.x += screenBounds.width - 60;
        moveAnimation2.toValue = NSValue(CGPoint: toPoint2)

        
        //rotate by x
        var rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 6.0 * M_PI
        
        //scale
        var scaleAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        scaleAnimation.duration = 1.5
        scaleAnimation.autoreverses = true
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 2.5
        scaleAnimation.fillMode = kCAFillModeForwards
        
        
        //grouping animations
        var myGroup = CAAnimationGroup()
        var myGroup2 = CAAnimationGroup()
        myGroup.autoreverses = true
        myGroup2.autoreverses = true

        myGroup.duration = 3.0;
        myGroup2.duration = 3.0;

        myGroup.animations = [moveAnimation, rotateAnimation, scaleAnimation]
        myGroup2.animations = [moveAnimation2, rotateAnimation, scaleAnimation]

        myGroup.fillMode = kCAFillModeForwards
        myGroup2.fillMode = kCAFillModeForwards

        
        myLayer.addAnimation(myGroup, forKey: "kkLayerMove")
        myLayer2.addAnimation(myGroup2, forKey: "kkLayerMove")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

