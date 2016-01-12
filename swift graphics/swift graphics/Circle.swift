//
//  Circle.swift
//  swift graphics
//
//  Created by RMK User on 12/01/16.
//  Copyright (c) 2016 RMK User. All rights reserved.
//

import UIKit

class Circle: UIView {

    override func drawRect(rect: CGRect) {
        let context=UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3.0)
        CGContextSetStrokeColorWithColor(context, UIColor.yellowColor().CGColor)
        CGContextMoveToPoint(context, 50, 50)
        CGContextAddLineToPoint(context, 50, 100)
         CGContextAddLineToPoint(context,  100,100)
         CGContextAddLineToPoint(context,  100,50)
         CGContextAddLineToPoint(context, 50, 50)
        CGContextStrokePath(context)
    }
    

}
