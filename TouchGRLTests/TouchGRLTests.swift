//
//  TouchGRLTests.swift
//  TouchGRLTests
//
//  Created by Mohamed El-Halawani on 2015-02-06.
//
//

import UIKit
import XCTest

class TouchGRLTests: XCTestCase {
    
    var dollarPRecognizer = DollarPRecoginzer()
    
    func testCalculateEuclideanDistanceZeroCase(){
        let distance: Float = dollarPRecognizer.calculateEuclideanDistance(GesturePoint(x:30, y:7, strokeId:1), secondPoint: GesturePoint(x:30, y:7, strokeId:1))
        
        XCTAssertEqual(Float(0.0), distance)
    }
    
    func testCalculateEuclideanDistance(){
        let distance : Float = dollarPRecognizer.calculateEuclideanDistance(GesturePoint(x:50, y:80, strokeId:1), secondPoint: GesturePoint(x:30, y:7, strokeId:1))
        
        XCTAssertEqualWithAccuracy(Float(75.6902), distance, 0.0001)
    }
    
    func testPathLength(){
        
        let length : Float = dollarPRecognizer.pathLength([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1)])
        
        XCTAssertEqualWithAccuracy(Float(75.6902), length, 0.0001)
    }
    
    func testPathLengthDifferentPoints(){
        
        let length : Float = dollarPRecognizer.pathLength([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1), GesturePoint(x:88, y:70, strokeId:2), GesturePoint(x:32, y:63, strokeId:2), GesturePoint(x:32, y:63, strokeId:2)])
        
        XCTAssertEqualWithAccuracy(Float(132.126), length, 0.001)
        
    }
    
    func testResampleWith2Points(){
        var newPoints = dollarPRecognizer.resample([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1)],samplingRate: 32)
        
        var expectedResults =
        [GesturePoint(x:50.000000, y:80.000000,strokeId:1),
            GesturePoint(x:49.354839, y:77.645164, strokeId:1),
            GesturePoint(x:48.709679, y:75.290329, strokeId:1),
            GesturePoint(x:48.064518, y:72.935493, strokeId:1),
            GesturePoint(x:47.419357, y:70.580658, strokeId:1),
            GesturePoint(x:46.774197, y:68.225822, strokeId:1),
            GesturePoint(x:46.129036, y:65.870987, strokeId:1),
            GesturePoint(x:45.483875, y:63.516148, strokeId:1),
            GesturePoint(x:44.838715, y:61.161308, strokeId:1),
            GesturePoint(x:44.193554, y:58.806469, strokeId:1),
            GesturePoint(x:43.548393, y:56.451630, strokeId:1),
            GesturePoint(x:42.903233, y:54.096790, strokeId:1),
            GesturePoint(x:42.258072, y:51.741951, strokeId:1),
            GesturePoint(x:41.612911, y:49.387112, strokeId:1),
            GesturePoint(x:40.967751, y:47.032272, strokeId:1),
            GesturePoint(x:40.322590, y:44.677433, strokeId:1),
            GesturePoint(x:39.677429, y:42.322594, strokeId:1),
            GesturePoint(x:39.032269, y:39.967754, strokeId:1),
            GesturePoint(x:38.387108, y:37.612915, strokeId:1),
            GesturePoint(x:37.741947, y:35.258076, strokeId:1),
            GesturePoint(x:37.096786, y:32.903236, strokeId:1),
            GesturePoint(x:36.451626, y:30.548397, strokeId:1),
            GesturePoint(x:35.806465, y:28.193558, strokeId:1),
            GesturePoint(x:35.161304, y:25.838718, strokeId:1),
            GesturePoint(x:34.516140, y:23.483879, strokeId:1),
            GesturePoint(x:33.870979, y:21.129040, strokeId:1),
            GesturePoint(x:33.225815, y:18.774200, strokeId:1),
            GesturePoint(x:32.580654, y:16.419361, strokeId:1),
            GesturePoint(x:31.935492, y:14.064523, strokeId:1),
            GesturePoint(x:31.290329, y:11.709684, strokeId:1),
            GesturePoint(x:30.645166, y:9.354846, strokeId:1),
            GesturePoint(x:30.000002, y:7.000008, strokeId:1)]
        
        XCTAssertEqual(newPoints.count, expectedResults.count)
        
        for var index = 0; index < newPoints.count; ++index {
            XCTAssertEqualWithAccuracy(newPoints[index].x, expectedResults[index].x, 0.0001, "X")
            
            XCTAssertEqualWithAccuracy(newPoints[index].y, expectedResults[index].y, 0.0001, "Y")
        }
    }
    
    func testResampleWith3Points(){
        var newPoints = dollarPRecognizer.resample([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1), GesturePoint(x:620, y:823, strokeId:1)],
            samplingRate: 32)
        
        var expectedResults =
        [GesturePoint(x:50.000000, y:80.000000, strokeId:1),
            GesturePoint(x:40.771851, y:46.317261, strokeId:1),
            GesturePoint(x:31.543705, y:12.634521, strokeId:1),
            GesturePoint(x:47.039791, y:30.566896, strokeId:1),
            GesturePoint(x:67.502655, y:58.868073, strokeId:1),
            GesturePoint(x:87.965515, y:87.169250, strokeId:1),
            GesturePoint(x:108.428375, y:115.470428, strokeId:1),
            GesturePoint(x:128.891235, y:143.771606, strokeId:1),
            GesturePoint(x:149.354095, y:172.072784, strokeId:1),
            GesturePoint(x:169.816956, y:200.373962, strokeId:1),
            GesturePoint(x:190.279816, y:228.675140, strokeId:1),
            GesturePoint(x:210.742676, y:256.976318, strokeId:1),
            GesturePoint(x:231.205536, y:285.277496, strokeId:1),
            GesturePoint(x:251.668396, y:313.578674, strokeId:1),
            GesturePoint(x:272.131256, y:341.879852, strokeId:1),
            GesturePoint(x:292.594116, y:370.181030, strokeId:1),
            GesturePoint(x:313.056976, y:398.482208, strokeId:1),
            GesturePoint(x:333.519836, y:426.783386, strokeId:1),
            GesturePoint(x:353.982697, y:455.084564, strokeId:1),
            GesturePoint(x:374.445557, y:483.385742, strokeId:1),
            GesturePoint(x:394.908417, y:511.686920, strokeId:1),
            GesturePoint(x:415.371277, y:539.988098, strokeId:1),
            GesturePoint(x:435.834137, y:568.289307, strokeId:1),
            GesturePoint(x:456.296997, y:596.590454, strokeId:1),
            GesturePoint(x:476.759857, y:624.891602, strokeId:1),
            GesturePoint(x:497.222717, y:653.192749, strokeId:1),
            GesturePoint(x:517.685547, y:681.493958, strokeId:1),
            GesturePoint(x:538.148438, y:709.795166, strokeId:1),
            GesturePoint(x:558.611328, y:738.096313, strokeId:1),
            GesturePoint(x:579.074158, y:766.397522, strokeId:1),
            GesturePoint(x:599.537048, y:794.698669, strokeId:1),
            GesturePoint(x:619.999878, y:822.999878, strokeId:1)]
        
        XCTAssertEqual(newPoints.count, expectedResults.count)
        
        for var index = 0; index < newPoints.count; ++index {
            XCTAssertEqualWithAccuracy(newPoints[index].x, expectedResults[index].x, 0.0001, "X")
            
            XCTAssertEqualWithAccuracy(newPoints[index].y, expectedResults[index].y, 0.0001, "Y")
        }
    }
    
    func testScale(){
        var newPoints = dollarPRecognizer.scale([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1)])
        
        var expectedResults =
        [GesturePoint(x:0.273973, y:1.000000, strokeId:1),
            GesturePoint(x:0.000000, y:0.000000, strokeId:1)]
        
        XCTAssertEqual(newPoints.count, expectedResults.count)
        
        for var index = 0; index < newPoints.count; ++index {
            XCTAssertEqualWithAccuracy(newPoints[index].x, expectedResults[index].x, 0.0001, "X")
            
            XCTAssertEqualWithAccuracy(newPoints[index].y, expectedResults[index].y, 0.0001, "Y")
        }
    }
    
    func testTranslateToOrigin(){
        var newPoints = dollarPRecognizer.translateToOrigin([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1)])
        
        var expectedResults =
        [GesturePoint(x:10.000000, y:36.500000, strokeId:1),
            GesturePoint(x:-10.000000, y:-36.500000, strokeId:1)]
        
        XCTAssertEqual(newPoints.count, expectedResults.count)
        
        for var index = 0; index < newPoints.count; ++index {
            XCTAssertEqualWithAccuracy(newPoints[index].x, expectedResults[index].x, 0.0001, "X")
            
            XCTAssertEqualWithAccuracy(newPoints[index].y, expectedResults[index].y, 0.0001, "Y")
        }
    }
    
    func testNormalize(){
        var newPoints = dollarPRecognizer.normalize([GesturePoint(x:50, y:80, strokeId:1), GesturePoint(x:30, y:7, strokeId:1), GesturePoint(x:620, y:823, strokeId:1)],samplingRate: 32)
        
        var expectedResults =
        [GesturePoint(x:-0.315999, y:-0.383919, strokeId:1),
            GesturePoint(x:-0.327387, y:-0.425484, strokeId:1),
            GesturePoint(x:-0.338774, y:-0.467049, strokeId:1),
            GesturePoint(x:-0.319652, y:-0.444920, strokeId:1),
            GesturePoint(x:-0.294401, y:-0.409996, strokeId:1),
            GesturePoint(x:-0.269149, y:-0.375072, strokeId:1),
            GesturePoint(x:-0.243898, y:-0.340148, strokeId:1),
            GesturePoint(x:-0.218646, y:-0.305224, strokeId:1),
            GesturePoint(x:-0.193395, y:-0.270300, strokeId:1),
            GesturePoint(x:-0.168144, y:-0.235376, strokeId:1),
            GesturePoint(x:-0.142892, y:-0.200452, strokeId:1),
            GesturePoint(x:-0.117641, y:-0.165528, strokeId:1),
            GesturePoint(x:-0.092389, y:-0.130604, strokeId:1),
            GesturePoint(x:-0.067138, y:-0.095680, strokeId:1),
            GesturePoint(x:-0.041887, y:-0.060756, strokeId:1),
            GesturePoint(x:-0.016635, y:-0.025832, strokeId:1),
            GesturePoint(x:0.008616, y:0.009092, strokeId:1),
            GesturePoint(x:0.033868, y:0.044016, strokeId:1),
            GesturePoint(x:0.059119, y:0.078940, strokeId:1),
            GesturePoint(x:0.084370, y:0.113864, strokeId:1),
            GesturePoint(x:0.109622, y:0.148788, strokeId:1),
            GesturePoint(x:0.134873, y:0.183712, strokeId:1),
            GesturePoint(x:0.160125, y:0.218635, strokeId:1),
            GesturePoint(x:0.185376, y:0.253559, strokeId:1),
            GesturePoint(x:0.210627, y:0.288483, strokeId:1),
            GesturePoint(x:0.235879, y:0.323407, strokeId:1),
            GesturePoint(x:0.261130, y:0.358331, strokeId:1),
            GesturePoint(x:0.286382, y:0.393255, strokeId:1),
            GesturePoint(x:0.311633, y:0.428179, strokeId:1),
            GesturePoint(x:0.336884, y:0.463103, strokeId:1),
            GesturePoint(x:0.362136, y:0.498027, strokeId:1),
            GesturePoint(x:0.387387, y:0.532951, strokeId:1)]
        
        XCTAssertEqual(newPoints.count, expectedResults.count)
        
        for var index = 0; index < newPoints.count; ++index {
            XCTAssertEqualWithAccuracy(newPoints[index].x, expectedResults[index].x, 0.0001, "X")
            
            XCTAssertEqualWithAccuracy(newPoints[index].y, expectedResults[index].y, 0.0001, "Y")
        }
    }
    
    func testCloudDistanceExcat(){
        
        var pointsArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var templatesArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var result = dollarPRecognizer.cloudDistance(points: pointsArray, templates: templatesArray, start: 0)
        
        XCTAssertEqualWithAccuracy(Float(0.0), result, 0.0001)
    }
    
    func testCloudDistanceDiffernt(){
        
        var pointsArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var templatesArray =
        [GesturePoint(x:600, y:20, strokeId:1),
            GesturePoint(x:800, y:20, strokeId:1),
            GesturePoint(x:700, y:20, strokeId:2),
            GesturePoint(x:700, y:90, strokeId:2)]
        
        var result = dollarPRecognizer.cloudDistance(points: pointsArray, templates: templatesArray, start: 0)
        println("result = \(result)")
        
        XCTAssertEqualWithAccuracy(Float(2543.75), result, 0.01)
    }
    
    func testGreadyCloudMatchExcat(){
        
        var pointsArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var templatesArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var result = dollarPRecognizer.greadyCloudMatch(pointsArray, template: templatesArray, samplingRate: 32)
        
        XCTAssertEqualWithAccuracy(Float(0.0), result, 0.0001)
    }
    
    func testGreadyCloudMatchDifferent(){
        
        var pointsArray =
        [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var templatesArray =
        [GesturePoint(x:600, y:20, strokeId:1),
            GesturePoint(x:800, y:20, strokeId:1),
            GesturePoint(x:700, y:20, strokeId:2),
            GesturePoint(x:700, y:90, strokeId:2)]
        
        var result = dollarPRecognizer.greadyCloudMatch(pointsArray, template: templatesArray, samplingRate: 32)
        
        XCTAssertEqualWithAccuracy(Float(2535.412598), result, 0.00001)
    }
    
    func testRecognizer() {
        
        var inputPoints: [GesturePoint] = [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var templatePoints: [GesturePoint] = [GesturePoint(x:30, y:7, strokeId:1),
            GesturePoint(x:103, y:7, strokeId:1),
            GesturePoint(x:66, y:7, strokeId:2),
            GesturePoint(x:66, y:87, strokeId:2)]
        
        var result = dollarPRecognizer.recoginzer(inputPoints, templates: templatePoints)
        
        println(result.score)
    }
}