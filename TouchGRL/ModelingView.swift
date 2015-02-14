//
//  ModelingView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-02-07.
//  
//  This class represent the modeling area of the application main view.
//  Please check https://www.youtube.com/watch?v=8KV1o9hPF5E for explanation
//
//

import UIKit

class ModelingView: UIView {

    var lastPoint: CGPoint!
    var freeFormLines: [FreeFormLine] = []

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()?.locationInView(self)
        freeFormLines.append(FreeFormLine(start: lastPoint, end: newPoint!))
        lastPoint = newPoint
        self.setNeedsDisplay()
    }

    override func drawRect(rect: CGRect) {
        // where the magic happens, drawing a line between two points on the view
        var context = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 2.0)
        
        for line in freeFormLines{
            CGContextMoveToPoint(context, line.startX, line.startY)
            CGContextAddLineToPoint(context, line.endX, line.endY)
        }
        
        CGContextStrokePath(context)
    }
}