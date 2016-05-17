//
//  AKHappySwitchVC.swift
//  AKHappySwitch
//
//  Created by Ashish Kakkad on 5/17/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class AKHappySwitchVC: UIViewController {
    
    //MARK: Declarations
    
    @IBOutlet var cnstSwitchButtonLeading: NSLayoutConstraint!
    @IBOutlet var cnstSmileLeading: NSLayoutConstraint!
    @IBOutlet var cnstSmileTrailing: NSLayoutConstraint!
    
    @IBOutlet var viewSwitch: UIView!
    @IBOutlet var viewFace: UIView!
    @IBOutlet var viewSmile: UIView!
    @IBOutlet var viewLeftEye: UIView!
    @IBOutlet var viewRightEye: UIView!
    
    @IBOutlet var btnSad: UIButton!
    @IBOutlet var btnHappy: UIButton!
    
    var isHappy : Bool!
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Corner Radius For All View
        
        setCornerRadius(viewSwitch, pixels: viewSwitch.frame.size.height/2)
        setCornerRadius(viewFace, pixels: viewFace.frame.size.height/2)
        setCornerRadius(viewLeftEye, pixels: viewLeftEye.frame.size.height/2)
        setCornerRadius(viewRightEye, pixels: viewRightEye.frame.size.height/2)
        setCornerRadius(viewSmile, pixels: viewSmile.frame.size.height/2)
        
        //Timer For Blinking Eyes
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(self.blinkEyes), userInfo: nil, repeats: true)
        
        //Gestures
        
        let gestureRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight))
        gestureRight.direction = UISwipeGestureRecognizerDirection.Right
        self.viewSwitch.addGestureRecognizer(gestureRight)
        
        let gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft))
        gestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.viewSwitch.addGestureRecognizer(gestureLeft)
        
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.toggleSwipe))
        self.viewSwitch.addGestureRecognizer(gestureTap)
        
        self.beHappy(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Class Functions
    
    func blinkEyes() {
        self.viewRightEye.frame = CGRectMake(self.viewRightEye.frame.origin.x, self.viewRightEye.frame.origin.y, self.viewRightEye.frame.size.width, 2)
        self.viewLeftEye.frame = CGRectMake(self.viewLeftEye.frame.origin.x, self.viewLeftEye.frame.origin.y, self.viewLeftEye.frame.size.width, 2)
        UIView.animateWithDuration(0.5) {
            self.viewRightEye.frame = CGRectMake(self.viewRightEye.frame.origin.x, self.viewRightEye.frame.origin.y, self.viewRightEye.frame.size.width, 6)
            self.viewLeftEye.frame = CGRectMake(self.viewLeftEye.frame.origin.x, self.viewLeftEye.frame.origin.y, self.viewLeftEye.frame.size.width, 6)
        }
    }
    
    func toggleSwipe() {
        isHappy == false ? swipeRight() : swipeLeft()
    }
    
    func swipeRight() {
        self.cnstSmileLeading.constant = 8
        self.cnstSmileTrailing.constant = 8
        self.cnstSwitchButtonLeading.constant = self.viewSwitch.frame.size.width-self.viewFace.frame.size.width-4;
        self.beHappy(true)
        UIView.animateWithDuration(0.5) {
            self.changeColor(UIColor.purpleColor())
            self.view.layoutIfNeeded()
        }
    }
    
    func swipeLeft() {
        self.cnstSwitchButtonLeading.constant = 4
        self.cnstSmileLeading.constant = 12
        self.cnstSmileTrailing.constant = 12
        self.beHappy(false)
        UIView.animateWithDuration(0.5) {
            self.changeColor(UIColor.lightGrayColor())
            self.view.layoutIfNeeded()
        }
    }
    
    func changeColor(color : UIColor) {
        self.viewSwitch.backgroundColor = color
        self.viewLeftEye.backgroundColor = color
        self.viewRightEye.backgroundColor = color
        self.viewSmile.backgroundColor = color
    }
    
    func beHappy(isHappy:Bool) {
        self.btnSad.selected = !isHappy
        self.btnHappy.selected = isHappy
        self.isHappy = isHappy
    }
    
    func setCornerRadius(view:UIView, pixels:CGFloat) {
        view.layer.cornerRadius = pixels
        view.clipsToBounds = true
    }
    
    //MARK: Actions
    
    @IBAction func btnSadPressed(sender: UIButton) {
        swipeLeft()
    }
    
    @IBAction func btnHappyPressed(sender: UIButton) {
        swipeRight()
    }
}