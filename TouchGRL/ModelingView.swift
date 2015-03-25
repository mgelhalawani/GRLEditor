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
    var strockID : Int = 1
    var touchPoints : [DollarPoint] = []


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
        addPoint(self.strockID, x: Float(lastPoint.x), y: Float(lastPoint.y))
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()?.locationInView(self)
        freeFormLines.append(FreeFormLine(start: lastPoint, end: newPoint!))
        lastPoint = newPoint
        self.setNeedsDisplay()
        addPoint(self.strockID, x: Float(lastPoint.x), y: Float(lastPoint.y))
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
        addPoint(self.strockID++, x: Float(lastPoint.x), y: Float(lastPoint.y))
        var recognizer : RecognizeController = RecognizeController()
        recognizer.recognize(touchPoints)
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
    
    func addPoint(strockID: Int, x: Float, y: Float){
        var point : DollarPoint = DollarPoint()
        point.id = strockID
        point.x = x
        point.y = y
        touchPoints.append(point)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}