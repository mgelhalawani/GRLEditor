//
//  GRLGoalView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-04-09.
//
//

import UIKit
import CoreGraphics
import Darwin

class GRLGoalView : GRLView{
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
        CGContextSetLineWidth(context, 2.5)
        CGContextStrokeEllipseInRect(context, CGRectMake(rect.origin.x + 10, rect.origin.y + 10, rect.width - 20, rect.height - 20))
        
        self.addTextField(rect, text: "Goal")
    }
}
