//
//  GRLView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-29.
//
//

import Foundation
import UIKit

class GRLView : UIView {
    
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
}