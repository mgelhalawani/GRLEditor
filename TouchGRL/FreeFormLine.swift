//
//  FreeFormLine.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-02-07.
//
//  A class to represent a free-form line drawn by user on the view.
//  Please check https://www.youtube.com/watch?v=8KV1o9hPF5E for explanation
//
//

import UIKit

struct FreeFormLine{
    
    private let start: CGPoint
    private let end: CGPoint
    
    // conveince proterty
    let startX:CGFloat
    let startY:CGFloat
    let endX:CGFloat
    let endY:CGFloat
    
    init(start _start: CGPoint, end _end: CGPoint){
        // Initilizing  start and end points
        start = _start
        end = _end
        
        startX = start.x
        startY = start.y
        endX = end.x
        endY = end.y
    }
}

