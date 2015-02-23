//
//  DollarPRecoginzer.swift
//  TouchGRL
//
//  This is Swift Implementation for $P Recoginzer
//  Please check http://depts.washington.edu/aimgroup/proj/dollar/pdollar.html
//  for full explination of $P Point-Cloud Recognizer
//
//  Created by Mohamed El-Halawani on 2015-02-16.
//
//

import Foundation
import UIKit

class DollarPRecoginzer{
    
    func recoginzer(points: [GesturePoint], templates: [GesturePoint]) -> (template: GesturePoint, score: Float){
        let samplingRate = 32 // denoted as n in $P pseudocode

        normalize(points, samplingRate: samplingRate)

        var score = Float.infinity
        
        var recognizedShape: GesturePoint?
        
        for template in templates{
            normalize([template], samplingRate: samplingRate)
            let tempScore = greadyCloudMatch(points, template: [template], samplingRate: samplingRate)
            if score > tempScore{
                score = tempScore
                recognizedShape = template
            }
        }
        
        return (recognizedShape!, score)
    }
    
    func greadyCloudMatch(points: [GesturePoint], template: [GesturePoint], samplingRate: Int) -> (Float){
        let exponent: Float = 1 - 0.50
        let step = Int(pow(Float(samplingRate), exponent))
        
        var minimum = Float.infinity
        
        for var index = 0; index < samplingRate; index += step{
            var distance1 = cloudDistance(points: points, templates: template, samplingRate: samplingRate, start: index)
            var distance2 = cloudDistance(points: template, templates: points, samplingRate: samplingRate, start: index)
            
            minimum = min(min(minimum, distance1), distance2)
        }
        return minimum
    }
    
    func cloudDistance(#points: [GesturePoint], templates: [GesturePoint], samplingRate: Int, start: Int) -> (Float){
        var matched = [Bool](count: samplingRate, repeatedValue: false)
        var sum: Float = 0.0
        var pointsIndex = start
        do{
            var min = Float.infinity
            var matchedIndex = -1
            for var templateIndex = 0; templateIndex < matched.count; ++templateIndex{
                if !matched[templateIndex]{
                    var distance = calculateEuclideanDistance(points[pointsIndex], secondPoint: templates[templateIndex])
                    if distance < min{
                        min = distance
                        matchedIndex = templateIndex
                    }
                }
            }
            matched[matchedIndex] = true
            var weight:Float = 1 - (Float(pointsIndex - start + samplingRate) % Float(samplingRate) / Float(samplingRate))
            sum = sum + (weight * min)
            
            pointsIndex = (pointsIndex + 1) % samplingRate
        
        } while pointsIndex == start
        
        return sum
    }
    
    func normalize(originalPoints: [GesturePoint], samplingRate: Int) -> ([GesturePoint]){
        var points: [GesturePoint] = resample(originalPoints, samplingRate: samplingRate)
        points = scale(points)
        points = translateToOrigin(points)
        return points
    }
    
    func calculateEuclideanDistance (firstPoint: GesturePoint, secondPoint: GesturePoint) -> (Float){
        return Float(sqrt(pow(secondPoint.x - firstPoint.x, 2) + pow(secondPoint.y - firstPoint.y, 2)))
    }
    
    func resample(var originalPoints: [GesturePoint], samplingRate: Int) -> ([GesturePoint]){
        var length:Float = pathLength(originalPoints) / Float(samplingRate - 1)
        var baseDistance: Float = 0.0
        var resampledPoints: [GesturePoint] = []
        
        for var index = 1; index < originalPoints.count; ++index{
            
            var previousPoint = originalPoints[index - 1]
            var currentPoint = originalPoints[index]
            
            if currentPoint.strokeId == previousPoint.strokeId{
                var euclideanDistance: Float = calculateEuclideanDistance(currentPoint, secondPoint: previousPoint)
                if (baseDistance + euclideanDistance) >= length{
                    let pointX: CGFloat = previousPoint.x + CGFloat((length - baseDistance) / euclideanDistance) * CGFloat(currentPoint.x - previousPoint.x)

                    let pointY: CGFloat = previousPoint.y + CGFloat((length - baseDistance) / euclideanDistance) * CGFloat(currentPoint.y - previousPoint.y)
                    
                    let newPoint: GesturePoint = GesturePoint(x: pointX, y: pointY, strokeId: currentPoint.strokeId)
                    
                    resampledPoints.append(newPoint)
                    originalPoints.insert(newPoint, atIndex: index)
                    baseDistance = 0
                } else {
                    baseDistance += euclideanDistance
                }
            }
        }
        return resampledPoints
    }
    
    func scale(originalPoints: [GesturePoint]) -> ([GesturePoint]){
        var xMin: Float = Float.infinity
        var yMin: Float = Float.infinity
        var xMax: Float = 0.0
        var yMax: Float = 0.0
        
        for var index = 0; index < originalPoints.count; ++index{
            xMin = min(xMin, Float(originalPoints[index].x))
            yMin = min(yMin, Float(originalPoints[index].y))
            xMax = max(xMax, Float(originalPoints[index].x))
            xMax = max(yMax, Float(originalPoints[index].y))
        }
        var scale: Float = max(xMax - xMin, yMax - yMin)
        
        var newPoints: [GesturePoint] = []
        for var index = 0; index < originalPoints.count; ++index{
            var currenrPoint = originalPoints[index]
            
            var pointX: CGFloat = CGFloat((Float(currenrPoint.x) - xMin) / scale)
            var pointY: CGFloat = CGFloat((Float(currenrPoint.y) - yMin) / scale)
            
            newPoints.insert(GesturePoint(x: pointX, y: pointY, strokeId: currenrPoint.strokeId), atIndex: index)
        }
        return newPoints
    }
    
    func translateToOrigin(originalPoints: [GesturePoint]) -> ([GesturePoint]){
        var centroid: GesturePoint = GesturePoint(x: 0, y: 0, strokeId: 0)
        var count = originalPoints.count
        for currentPoint in originalPoints{
            centroid = GesturePoint(x: centroid.x + currentPoint.x, y: centroid.y + currentPoint.y, strokeId: 0)
        }
        centroid = GesturePoint(x: centroid.x / CGFloat(count), y: centroid.y / CGFloat(count), strokeId:0)
        
        var newPoints: [GesturePoint] = []
        for var index = 0; index < count; ++index{
            var currenrPoint = originalPoints[index]
            
            var pointX: CGFloat = currenrPoint.x - centroid.x
            var pointY: CGFloat = currenrPoint.y - centroid.y
            
            newPoints.insert(GesturePoint(x: pointX, y: pointY, strokeId: currenrPoint.strokeId), atIndex: index)
        }
        return newPoints
    }
        
    func pathLength(originalPoints: [GesturePoint]) -> (Float){
        var length: Float = 0
        for var index = 1; index < originalPoints.count; ++index{
            if originalPoints[index].strokeId == originalPoints[index - 1].strokeId{
                length += calculateEuclideanDistance(originalPoints[index], secondPoint: originalPoints[index - 1])
            }
        }
        return length
    }
}