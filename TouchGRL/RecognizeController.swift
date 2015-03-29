//
//  Recognizer.swift
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-24.
//
//

import Foundation

class RecognizeController{
    
    func recognize(points: [DollarPoint]) -> (DollarResult){
        
        var dP : DollarP = DollarP()
        setTemplatePoints(dP)
        var result = dP.recognize(points)
        return result
    }
    
    func setTemplatePoints(dP: DollarP){
        
        dP.pointClouds[0] = makePointCloud("Softgoal", points: [makePoint(0.2314232, y: 0.1754333, id: 1),
            makePoint(0.1584939, y: 0.1371011, id: 1),
            makePoint(0.08591288, y: 0.09725533, id: 1),
            makePoint(0.01672, y: 0.05202715, id: 1),
            makePoint(-0.05430198, y: -0.009484708, id: 1),
            makePoint(-0.1272047, y: 0.02977058, id: 1),
            makePoint(-0.2011313, y: 0.06705306, id: 1),
            makePoint(-0.2778037, y: 0.09736158, id: 1),
            makePoint(-0.3567026, y: 0.1194193, id: 1),
            makePoint(-0.4390334, y: 0.1156121, id: 1),
            makePoint(-0.5029784, y: 0.06536262, id: 1),
            makePoint(-0.5155368, y: 0.01539892, id: 1),
            makePoint(-0.4943206, y: -0.08775715, id: 1),
            makePoint(-0.4183866, y: -0.1206569, id: 1),
            makePoint(-0.3414862, y: -0.1500778, id: 1),
            makePoint(-0.2589237, y: -0.1557764, id: 1),
            makePoint(-0.1779053, y: -0.1465276, id: 1),
            makePoint(-0.1043036, y: -0.1092242, id: 1),
            makePoint(-0.03921571, y: -0.05948764, id: 1),
            makePoint(0.02239275, y: -0.004302949, id: 1),
            makePoint(0.07758337, y: 0.05731143, id: 1),
            makePoint(0.1289304, y: 0.1217631, id: 1),
            makePoint(0.1903133, y: 0.1770427, id: 1),
            makePoint(0.2631114, y: 0.2138907, id: 1),
            makePoint(0.3450109, y: 0.2177035, id: 1),
            makePoint(0.4262508, y: 0.2050341, id: 1),
            makePoint(0.4844632, y: 0.1506262, id: 1),
            makePoint(0.4668711, y: 0.07254036, id: 1),
            makePoint(0.4307792, y: -0.001833647, id: 1),
            makePoint(0.3820186, y: -0.06855541, id: 1),
            makePoint(0.3282216, y:  -0.1310531, id: 1),
            makePoint(0.2707369, y: -0.1885379, id: 1)
            ])
    }
    
    func makePointCloud(name: NSString, points: NSArray) -> (DollarPointCloud){
        var pointCloud : DollarPointCloud = DollarPointCloud(name: name, points:points)
        return pointCloud
    }
    
    func makePoint(x: Float, y: Float, id: Int) -> (DollarPoint) {
        return DollarPoint(id: id, x: x, y: y)
    }
}


