//*********************************************
//**************** WARNING ********************
//*********************************************
// This Swift implentation of DollarP Algorithm 
// is not yet ready to be used.
// Testing found erros in the calcualtions of 
// cloudDistance. More work need to be done 
// before this class is ready
// For now, you can use the Objective-C
// implementation written by Felix Raab, 
// check http://fe9lix.github.io/DollarP_ObjC/
// for detials.
//*********************************************


//  DollarPRecoginzer.swift
//  TouchGRL
//
//  This is Swift Implementation for $P Recoginzer
//  Please check http://depts.washington.edu/aimgroup/proj/dollar/pdollar.html
//  for full explination of $P Point-Cloud Recognizer
//
//  Created by Mohamed El-Halawani on 2015-02-16.


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
    
    func greadyCloudMatch(points: [GesturePoint], template: [GesturePoint], samplingRate:Int) -> (Float){
        var count = points.count
        let exponent: Float = 1 - 0.50
        let step = Int(pow(Float(count), exponent))
        var minimum = Float.infinity
        
        for var index = 0; index < count; index += step{
            var distance1 = cloudDistance(points: points, templates: template, start: index)
            var distance2 = cloudDistance(points: template, templates: points, start: index)
            
            println("distance1 \(distance1) distance2 \(distance2)")
            minimum = min(min(minimum, distance1), distance2)
        }
        return minimum
    }
    
    func cloudDistance(#points: [GesturePoint], templates: [GesturePoint], start: Int) -> (Float){
        
        var pointsNumber :Int = points.count
        var matched : [Bool] = [Bool](count: pointsNumber, repeatedValue: false)
        var sum: Float = 0.0
        var pointsIndex = start
        do{

            var matchedIndex = -1

            var min = Float.infinity

            for var templateIndex = 0; templateIndex < matched.count; ++templateIndex{
                if !matched[templateIndex]{
                    if pointsIndex < points.count && templateIndex < templates.count {
                        var template = templates[templateIndex]
                        var point = points[pointsIndex]
                        var distance = calculateEuclideanDistance(point, secondPoint:template)
                        println("distance \(distance)")
                        if distance < min{
                            min = distance
                            matchedIndex = templateIndex
                        }
                    }
                }
            }
            if matchedIndex > -1{
                matched[matchedIndex] = true
            }
            var weight:Float = 1.0 - Float(((pointsIndex - start + pointsNumber) % pointsNumber) / pointsNumber)
            
            println("sum =\(sum) weight=\(weight) min=\(min)")
            sum = sum + (weight * min)
            if pointsIndex < pointsNumber{
                pointsIndex = (pointsIndex + 1) % pointsNumber
            }
        } while pointsIndex != start
        println("sum = \(sum)")
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
        var resampledPoints: [GesturePoint] = [originalPoints[0]]
        
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
        
        if resampledPoints.count == (samplingRate - 1) {
            var index = originalPoints.count - 1
            resampledPoints.append(originalPoints[index])
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
            yMax = max(yMax, Float(originalPoints[index].y))
        }
        
        var scale: Float = max(xMax - xMin, yMax - yMin)
        
        var newPoints: [GesturePoint] = []
        for var index = 0; index < originalPoints.count; ++index{
            var currenrPoint = originalPoints[index]
            
            var pointX: Float = (Float(currenrPoint.x) - xMin) / scale
            var pointY: Float = (Float(currenrPoint.y) - yMin) / scale
            
            newPoints.insert(GesturePoint(x: CGFloat(pointX), y: CGFloat(pointY), strokeId: currenrPoint.strokeId), atIndex: index)
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
            var currentPoint = originalPoints[index]
            var previousPoint = originalPoints[index - 1]
            if currentPoint.strokeId == previousPoint.strokeId{
                length += calculateEuclideanDistance(currentPoint, secondPoint: previousPoint)
            }
        }
        return length
    }
}