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
    var sectionHeight : CGFloat
    var sectionWidth : CGFloat
    
    override init(frame: CGRect){

        sectionHeight = frame.height / 10
        sectionWidth = frame.width / 10
        
        self.xMargin =  1.2 * sectionWidth
        self.yMarign = sectionHeight * 0.5
        self.controlPointDifference = 2 * sectionWidth
        
        super.init(frame: frame)
        
        self.addTextField(frame)
    }

    required init(coder aDecoder: NSCoder) {
        sectionHeight = 1
        sectionWidth = 1
        
        self.xMargin =  1.2 * sectionWidth
        self.yMarign = sectionHeight * 0.5
        self.controlPointDifference = 2 * sectionWidth

        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        var softgoalPath = UIBezierPath()
        softgoalPath.lineWidth = 2.5
        softgoalPath.lineCapStyle = kCGLineCapRound
        drawLeftPart(softgoalPath)
        drawLowerPart(softgoalPath)
        drawRightPart(softgoalPath)
        drawUpperPart(softgoalPath)
    }
    
    func drawLowerPart(path: UIBezierPath){
        
        var startPointX = self.bottomLeftPoint().x + xMargin
        var startPointY = self.bottomLeftPoint().y - yMarign
        
        var endPointX = self.bottomRightPoint().x - xMargin
        var endPointY = startPointY
        
        
        var controlPointX = (startPointX + endPointX) / 2
        var controlPointY = bottomLeftPoint().y - (4 * yMarign)
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(endPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
        
    }
    
    func drawUpperPart(path: UIBezierPath){
        
        var startPointX = self.topLeftPoint().x + xMargin
        var startPointY = self.topLeftPoint().y + yMarign
        
        var endPointX = self.topRightPoint().x - xMargin
        var endPointY = startPointY
        
        
        var controlPointX = (startPointX + endPointX) / 2
        var controlPointY = topLeftPoint().y + (4 * yMarign)
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(endPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
        
    }
    
    func drawLeftPart(path: UIBezierPath){
        var startPointX = self.topLeftPoint().x + xMargin
        var startPointY = self.topLeftPoint().y + yMarign
        var endPointY = self.bottomLeftPoint().y - yMarign
        var controlPointX =  startPointX - controlPointDifference
        var controlPointY = (endPointY + startPointY) / 2
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(startPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
    }
    
    func drawRightPart(path: UIBezierPath){
        
        var startPointX = self.topRightPoint().x - xMargin
        var startPointY = self.topRightPoint().y + yMarign
        
        var endPointY = self.bottomRightPoint().y - yMarign
        
        var controlPointX =  startPointX + controlPointDifference
        var controlPointY = (endPointY + startPointY) / 2
        
        path.moveToPoint(CGPointMake(startPointX, startPointY))
        path.addQuadCurveToPoint(CGPointMake(startPointX, endPointY), controlPoint: CGPointMake(controlPointX, controlPointY))
        path.stroke()
    }
    
    func addTextField(frame: CGRect){
        var frame = CGRectMake(0, 0, 80, 40)
        var textField = UITextField(frame: frame)
        textField.textColor = UIColor.blackColor()
        textField.backgroundColor = UIColor.whiteColor()
        textField.borderStyle = UITextBorderStyle.RoundedRect
        var centerX = self.width() / 2
        var CenterY = self.height() / 2
        textField.center = CGPointMake(centerX, CenterY)
        self.addSubview(textField)
    }
    
}