//
//  GRLSoftgoalView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-29.
//
//

import Foundation
import UIKit

class GRLSoftgoalView : GRLView{
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 2.0)
        CGContextMoveToPoint(context, 5, 5)
        CGContextAddLineToPoint(context, 50, 5)
        CGContextStrokePath(context)
    }

}