//
//  GRLContributionView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-04-06.
//
//

import UIKit
import CoreGraphics
import Darwin

class GRLContributionView : GRLView{
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
        CGContextSetLineWidth(context, 2.5)
        
        CGContextMoveToPoint(context, self.topLeftPoint().x, self.topLeftPoint().y)
        CGContextAddLineToPoint(context, self.topRightPoint().x, self.topLeftPoint().y)
        CGContextStrokePath(context)
    }
    
}