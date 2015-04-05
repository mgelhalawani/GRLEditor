//
//  GRLView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-29.
//
//

import Foundation
import UIKit

class GRLView : UIView, UIGestureRecognizerDelegate{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let recognizer = UIPinchGestureRecognizer(target: self, action:Selector("handlePinch:"))
        recognizer.delegate = self
        self.addGestureRecognizer(recognizer)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func radiansFromDegrees(degrees: CGFloat) -> (CGFloat){
        return (CGFloat (M_PI) * degrees) / 180
    }
    
    func topLeftPoint()->(x: CGFloat, y: CGFloat){
        return (self.bounds.origin.x, self.bounds.origin.y)
    }
    
    func topRightPoint()->(x: CGFloat, y: CGFloat){
        return (self.bounds.size.width, self.bounds.origin.y)
    }
    
    func bottomLeftPoint()->(x: CGFloat, y: CGFloat){
        return (self.bounds.origin.x, self.bounds.size.height)
    }
    
    func bottomRightPoint()->(x: CGFloat, y: CGFloat){
        return (self.bounds.size.width, self.bounds.size.height)
    }
    
    func width()->(CGFloat){
        return self.bounds.size.width
    }

    func height()->(CGFloat){
        return self.bounds.size.height
    }
    
    func handlePinch(recognizer : UIPinchGestureRecognizer){
        self.transform = CGAffineTransformScale(self.transform, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
        self.setNeedsDisplay()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // do nothing
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // do nothing
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // do nothing
    }
}