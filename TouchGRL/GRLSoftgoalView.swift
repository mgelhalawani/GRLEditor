//
//  GRLSoftgoalView.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-29.
//
//

import Foundation
import UIKit
import CoreGraphics
import Darwin

class GRLSoftgoalView : GRLView{
    
    var xMargin : CGFloat
    var yMarign : CGFloat
    var controlPointDifference : CGFloat
    
    override init(frame: CGRect){
        
        let sectionWidth = frame.width / 10
        let sectionHeight = frame.height / 10
        
        self.xMargin =  1.2 * sectionWidth
        self.yMarign = sectionHeight * 0.5
        self.controlPointDifference = 2 * sectionWidth
        
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        var softgoalPath = UIBezierPath()
        drawRightHalf(softgoalPath)
        drawLeftHalf(softgoalPath)
    }
    
    func drawRightHalf(path: UIBezierPath){
        var startPointX = self.topLeftPoint().x + xMargin
        var startPointY = self.topLeftPoint().y + yMarign
        var endPointY = self.bottomLeftPoint().y - yMarign
        var controlPointX =  startPointX - controlPointDifference
        var controlPointY = (endPointY + startPointY) / 2
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(startPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
    }
    
    func drawLeftHalf(path: UIBezierPath){
        
        var startPointX = self.topRightPoint().x - xMargin
        var startPointY = self.topRightPoint().y + yMarign
        
        var endPointY = self.bottomRightPoint().y - yMarign
        
        var controlPointX =  startPointX + controlPointDifference
        var controlPointY = (endPointY + startPointY) / 2
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(startPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
    }
}