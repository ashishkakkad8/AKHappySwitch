//
//  ArcView.swift
//  AKHappySwitch
//
//  Created by MAC-186 on 5/18/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit

class ArcView: UIView {
    
    var color:UIColor = UIColor.lightGrayColor()
    
    override func drawRect(rect: CGRect) {
        let degree = ((CGFloat(M_PI) * 180)/180.0)
        let aPath : UIBezierPath = UIBezierPath()
        aPath.addArcWithCenter(CGPointMake(rect.width/2, rect.height/2), radius: (rect.width-1)/2, startAngle: 0, endAngle: degree, clockwise: true)
        aPath.closePath()
        color.setFill()
        aPath.fill()
    }
}
