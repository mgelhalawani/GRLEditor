//
//  FreeFormLine.swift
//  GRLEditor
//
//  Created by Mohamed El-Halawani on 2015-02-07.
//
//  A class to represent a free-form line drawn by user on the view.
//  Please check https://www.youtube.com/watch?v=8KV1o9hPF5E for explanation
//
//

import UIKit

class FreeFormLine{
    
    private var start: CGPoint
    var startX:CGFloat{
        get {
            return start.x
        }
    }
    
    var startY:CGFloat{
        get {
            return start.y
        }
    }
    
    private var end: CGPoint
    var endX:CGFloat{
        get {
            return end.x
        }
    }
    
    var endY:CGFloat{
        get {
            return end.y
        }
    }
    
    init(start _start: CGPoint, end _end: CGPoint){
        self.start = _start
        self.end = _end
    }
}

