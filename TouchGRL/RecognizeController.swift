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
        
        dP.pointClouds[1] = makePointCloud("Softgoal", points: [makePoint(0.2303054, y: -0.1660875, id: 1),
            makePoint(0.1652096, y: -0.1009918, id: 1),
            makePoint(0.1001138, y: -0.03589602, id: 1),
            makePoint(0.03123546, y: 0.02465227, id: 1),
            makePoint(-0.04462525, y: 0.07680646, id: 1),
            makePoint(-0.1204859, y: 0.128961, id: 1),
            makePoint(-0.1969514, y: 0.1802172, id: 1),
            makePoint(-0.2753589, y: 0.2269827, id: 1),
            makePoint(-0.365641, y: 0.2362113, id: 1),
            makePoint(-0.4514503, y: 0.2211223, id: 1),
            makePoint(-0.4823383, y: 0.137762, id: 1),
            makePoint(-0.4938325, y: 0.05046383, id: 1),
            makePoint(-0.4938325, y: -0.04159543, id: 1),
            makePoint(-0.4823383, y: -0.1309414, id: 1),
            makePoint(-0.4031778, y: -0.1660875, id: 1),
            makePoint(-0.3111185, y: -0.1660875, id: 1),
            makePoint(-0.2199004, y: -0.1619887, id: 1),
            makePoint(-0.1384497, y: -0.1210495, id: 1),
            makePoint(-0.06207818, y: -0.07197796, id: 1),
            makePoint(0.006469846, y: -0.01646052, id: 1),
            makePoint(0.07939816, y: 0.03962341, id: 1),
            makePoint(0.149812, y: 0.09824663, id: 1),
            makePoint(0.2357317, y: 0.1297292, id: 1),
            makePoint(0.3242596, y: 0.1538528, id: 1),
            makePoint(0.4161309, y: 0.1557516, id: 1),
            makePoint(0.4895827, y: 0.1250463, id: 1),
            makePoint(0.5061675, y: 0.03652641, id: 1),
            makePoint(0.4939243, y: -0.05264279, id: 1),
            makePoint(0.4417529, y: -0.1270538, id: 1),
            makePoint(0.3754432, y: -0.1897905, id: 1),
            makePoint(0.2887248, y: -0.215264, id: 1),
            makePoint(0.2073172, y: -0.2580415, id: 1)
        ])
        
        dP.pointClouds[2] = makePointCloud("Softgoal", points: [makePoint(0.1279026, y: -0.2563406, id: 1),
            makePoint(0.1163269, y: -0.1589522, id: 1),
            makePoint(0.0828768, y: -0.06641059, id: 1),
            makePoint(0.04015541, y: 0.02232656, id: 1),
            makePoint(-0.007300496, y: 0.1086726, id: 1),
            makePoint(-0.06186184, y: 0.1902395, id: 1),
            makePoint(-0.1435342, y: 0.2424094, id: 1),
            makePoint(-0.2389623, y: 0.266108, id: 1),
            makePoint(-0.337226, y: 0.2704607, id: 1),
            makePoint(-0.4274525, y: 0.2419069, id: 1),
            makePoint(-0.4819008, y: 0.1610799, id: 1),
            makePoint(-0.510844, y: 0.06751385, id: 1),
            makePoint(-0.5098329, y: -0.03092065, id: 1),
            makePoint(-0.4702283, y: -0.1153156, id: 1),
            makePoint(-0.3756874, y: -0.1378103, id: 1),
            makePoint(-0.2771527, y: -0.1378103, id: 1),
            makePoint(-0.1860439, y: -0.1100474, id: 1),
            makePoint(-0.1073809, y: -0.05093572, id: 1),
            makePoint(-0.02920568, y: 0.008934289, id: 1),
            makePoint(0.04406172, y: 0.07467452, id: 1),
            makePoint(0.1185509, y: 0.1386656, id: 1),
            makePoint(0.2104024, y: 0.1730773, id: 1),
            makePoint(0.3064721, y: 0.1899804, id: 1),
            makePoint(0.396043, y: 0.1640479, id: 1),
            makePoint(0.4593891, y: 0.09113413, id: 1),
            makePoint(0.489156, y: -0.001958847, id: 1),
            makePoint(0.4860576, y: -0.1001065, id: 1),
            makePoint(0.4378197, y: -0.1834842, id: 1),
            makePoint(0.3531327, y: -0.2314993, id: 1),
            makePoint(0.2581553, y: -0.2576949, id: 1),
            makePoint(0.1628896, y: -0.2760957, id: 1),
            makePoint(0.07522249, y: -0.2958507, id: 1)
        ])
        
        dP.pointClouds[3] = makePointCloud("Delete", points: [makePoint(0.1619944, y: -0.4556088, id: 1),
            makePoint(0.1442472, y: -0.3846198, id: 1),
            makePoint(0.1108587, y: -0.3196877, id: 1),
            makePoint(0.07616705, y: -0.2552602, id: 1),
            makePoint(0.04440796, y: -0.1893381, id: 1),
            makePoint(0.01266405, y: -0.1234085, id: 1),
            makePoint(-0.01907986, y: -0.05747885, id: 1),
            makePoint(-0.05082932, y: 0.008448184, id: 1),
            makePoint(-0.08264163, y: 0.07434487, id: 1),
            makePoint(-0.1144538, y: 0.1402416, id: 1),
            makePoint(-0.1462659, y: 0.2061383, id: 1),
            makePoint(-0.1780782, y: 0.272035, id: 1),
            makePoint(-0.2106892, y: 0.3375391, id: 1),
            makePoint(-0.247701, y: 0.4005831, id: 1),
            makePoint(-0.2889197, y: 0.4609636, id: 1),
            makePoint(-0.4462031, y: -0.3216633, id: 2),
            makePoint(-0.3876641, y: -0.277759, id: 2),
            makePoint(-0.3269784, y: -0.2368889, id: 2),
            makePoint(-0.2660941, y: -0.1962994, id: 2),
            makePoint(-0.2052099, y: -0.1557099, id: 2),
            makePoint(-0.1443256, y: -0.1151204, id: 2),
            makePoint(-0.0829888, y: -0.07522199, id: 2),
            makePoint(-0.02143654, y: -0.03565273, id: 2),
            makePoint(0.04094908, y: 0.002556205, id: 2),
            makePoint(0.1041551, y: 0.03942642, id: 2),
            makePoint(0.167361, y: 0.07629651, id: 2),
            makePoint(0.230567, y: 0.1131666, id: 2),
            makePoint(0.2957361, y: 0.1464075, id: 2),
            makePoint(0.3611847, y: 0.1791318, id: 2),
            makePoint(0.4266333, y: 0.2118563, id: 2),
            makePoint(0.4888369, y: 0.2503668, id: 2),
            makePoint(0.5537969, y: 0.2802159, id: 2)
        ])
        
        dP.pointClouds[4] = makePointCloud("Contribution", points: [makePoint(-0.5025178, y: -0.02667875, id: 1),
            makePoint(-0.4699531, y: -0.02667875, id: 1),
            makePoint(-0.4373883, y: -0.02667875, id: 1),
            makePoint(-0.4048235, y: -0.02667875, id: 1),
            makePoint(-0.3722588, y: -0.02667875, id: 1),
            makePoint(-0.339694, y: -0.02667875, id: 1),
            makePoint(-0.3071292, y: -0.02667875, id: 1),
            makePoint(-0.2745645, y: -0.02667875, id: 1),
            makePoint(-0.2419997, y: -0.02667875, id: 1),
            makePoint(-0.209435, y: -0.02667875, id: 1),
            makePoint(-0.1768702, y: -0.02667875, id: 1),
            makePoint(-0.1443054, y: -0.02667875, id: 1),
            makePoint(-0.1117406, y: -0.02667875, id: 1),
            makePoint(-0.07922667, y: -0.02555764, id: 1),
            makePoint(-0.04679558, y: -0.02260935, id: 1),
            makePoint(-0.01438215, y: -0.01952373, id: 1),
            makePoint(0.01773959, y: -0.01417009, id: 1),
            makePoint(0.04986131, y: -0.008816453, id: 1),
            makePoint(0.08188868, y: -0.00294809, id: 1),
            makePoint(0.113821, y: 0.00343834, id: 1),
            makePoint(0.1457534, y: 0.00982477, id: 1),
            makePoint(0.1778319, y: 0.01517684, id: 1),
            makePoint(0.2102842, y: 0.0178812, id: 1),
            makePoint(0.2427365, y: 0.02058556, id: 1),
            makePoint(0.27488, y: 0.02562525, id: 1),
            makePoint(0.3069195, y: 0.03145055, id: 1),
            makePoint(0.3390375, y: 0.03679196, id: 1),
            makePoint(0.3712751, y: 0.0413973, id: 1),
            makePoint(0.4026707, y: 0.04995047, id: 1),
            makePoint(0.4343326, y: 0.05725484, id: 1),
            makePoint(0.4665701, y: 0.06186027, id: 1),
            makePoint(0.4974822, y: 0.06921166, id: 1),
            makePoint(-0.5007286, y: -0.005238007, id: 1),
            makePoint(-0.4684008, y: -0.005238007, id: 1),
            makePoint(-0.4360729, y: -0.005238007, id: 1),
            makePoint(-0.4037451, y: -0.005238007, id: 1),
            makePoint(-0.3714173, y: -0.005238007, id: 1),
            makePoint(-0.3390895, y: -0.005238007, id: 1),
            makePoint(-0.3067617, y: -0.005238007, id: 1),
            makePoint(-0.2744339, y: -0.005238007, id: 1),
            makePoint(-0.242106, y: -0.005238007, id: 1),
            makePoint(-0.2097782, y: -0.005238007, id: 1),
            makePoint(-0.1774504, y: -0.005238007, id: 1),
            makePoint(-0.1451225, y: -0.005238007, id: 1),
            makePoint(-0.1127947, y: -0.005238007, id: 1),
            makePoint(-0.08046687, y: -0.005238007, id: 1),
            makePoint(-0.04813907, y: -0.005238007, id: 1),
            makePoint(-0.01581123, y: -0.005238007, id: 1),
            makePoint(0.01651663, y: -0.005238007, id: 1),
            makePoint(0.0488444, y: -0.005238007, id: 1),
            makePoint(0.08117223, y: -0.005238007, id: 1),
            makePoint(0.1135001, y: -0.005238007, id: 1),
            makePoint(0.1458279, y: -0.005238007, id: 1),
            makePoint(0.1781557, y: -0.005238007, id: 1),
            makePoint(0.2104836, y: -0.005238007, id: 1),
            makePoint(0.242639, y: -0.002468491, id: 1),
            makePoint(0.2747172, y: 0.001541334, id: 1),
            makePoint(0.3067955, y: 0.005550974, id: 1),
            makePoint(0.3388737, y: 0.009560799, id: 1),
            makePoint(0.3709401, y: 0.01365848, id: 1),
            makePoint(0.402943, y: 0.01823019, id: 1),
            makePoint(0.4346943, y: 0.02427083, id: 1),
            makePoint(0.4669436, y: 0.02506502, id: 1),
            makePoint(0.4992714, y: 0.02506502, id: 1)
        ])
        
        dP.pointClouds[5] = makePointCloud("Contribution", points: [makePoint(-0.3307253, y: 0.5036492, id: 1),
            makePoint(-0.3132443, y: 0.4686869, id: 1),
            makePoint(-0.2957631, y: 0.4337249, id: 1),
            makePoint(-0.2701568, y: 0.4046191, id: 1),
            makePoint(-0.2456827, y: 0.3742333, id: 1),
            makePoint(-0.2222293, y: 0.3429621, id: 1),
            makePoint(-0.1997662, y: 0.3110252, id: 1),
            makePoint(-0.1796552, y: 0.2775066, id: 1),
            makePoint(-0.1595441, y: 0.2439884, id: 1),
            makePoint(-0.1387611, y: 0.2108953, id: 1),
            makePoint(-0.1170785, y: 0.1783715, id: 1),
            makePoint(-0.09602724, y: 0.14544, id: 1),
            makePoint(-0.0753102, y: 0.1122927, id: 1),
            makePoint(-0.0563651, y: 0.07821891, id: 1),
            makePoint(-0.04096723, y: 0.0422906, id: 1),
            makePoint(-0.02220315, y: 0.008256465, id: 1),
            makePoint(0.0005168915, y: -0.02355134, id: 1),
            makePoint(0.02382058, y: -0.05491784, id: 1),
            makePoint(0.04823917, y: -0.08544099, id: 1),
            makePoint(0.07265779, y: -0.1159641, id: 1),
            makePoint(0.09707642, y: -0.1464876, id: 1),
            makePoint(0.121495, y: -0.1770107, id: 1),
            makePoint(0.1479056, y: -0.205751, id: 1),
            makePoint(0.1712183, y: -0.2367697, id: 1),
            makePoint(0.19155, y: -0.2701485, id: 1),
            makePoint(0.2108697, y: -0.303828, id: 1),
            makePoint(0.2285064, y: -0.3381468, id: 1),
            makePoint(0.2529882, y: -0.3685259, id: 1),
            makePoint(0.2697271, y: -0.4034771, id: 1),
            makePoint(0.2874002, y: -0.437962, id: 1),
            makePoint(0.3067716, y: -0.4718271, id: 1),
            makePoint(0.332736, y: -0.4963508, id: 1)
        ])
        
        dP.pointClouds[6] = makePointCloud("Contribution", points: [makePoint(-0.5144386, y: -0.4718124, id: 1),
            makePoint(-0.473399, y: -0.4530804, id: 1),
            makePoint(-0.4363108, y: -0.4265889, id: 1),
            makePoint(-0.3987134, y: -0.400835, id: 1),
            makePoint(-0.3607903, y: -0.375553, id: 1),
            makePoint(-0.3252166, y: -0.3474052, id: 1),
            makePoint(-0.2929882, y: -0.3151768, id: 1),
            makePoint(-0.2607598, y: -0.2829484, id: 1),
            makePoint(-0.2285314, y: -0.25072, id: 1),
            makePoint(-0.1992462, y: -0.2158038, id: 1),
            makePoint(-0.1667602, y: -0.1844712, id: 1),
            makePoint(-0.1288372, y: -0.1591892, id: 1),
            makePoint(-0.09954566, y: -0.1244924, id: 1),
            makePoint(-0.06671354, y: -0.0932619, id: 1),
            makePoint(-0.03217104, y: -0.06361887, id: 1),
            makePoint(-0.000197649, y: -0.03114733, id: 1),
            makePoint(0.03046137, y: 0.002577424, id: 1),
            makePoint(0.06112033, y: 0.03630248, id: 1),
            makePoint(0.09156841, y: 0.07021084, id: 1),
            makePoint(0.1207466, y: 0.1052247, id: 1),
            makePoint(0.1495324, y: 0.140559, id: 1),
            makePoint(0.1777179, y: 0.1763717, id: 1),
            makePoint(0.2050645, y: 0.2128339, id: 1),
            makePoint(0.234774, y: 0.2467986, id: 1),
            makePoint(0.2645206, y: 0.279369, id: 1),
            makePoint(0.2977442, y: 0.3103836, id: 1),
            makePoint(0.3279097, y: 0.3425138, id: 1),
            makePoint(0.3490303, y: 0.3827903, id: 1),
            makePoint(0.3786919, y: 0.4173955, id: 1),
            makePoint(0.4074491, y: 0.452686, id: 1),
            makePoint(0.4305058, y: 0.4919005, id: 1),
            makePoint(0.4577835, y: 0.5281876, id: 1)
        ])
        
        dP.pointClouds[7] = makePointCloud("Goal", points: [makePoint(-0.1704882, y: -0.2364176, id: 1),
            makePoint(-0.2487023, y: -0.2289447, id: 1),
            makePoint(-0.3265899, y: -0.2179361, id: 1),
            makePoint(-0.3928486, y: -0.1802318, id: 1),
            makePoint(-0.4386773, y: -0.1190754, id: 1),
            makePoint(-0.4651605, y: -0.04498978, id: 1),
            makePoint(-0.4762207, y: 0.0326829, id: 1),
            makePoint(-0.4643919, y: 0.1102609, id: 1),
            makePoint(-0.420083, y: 0.175221, id: 1),
            makePoint(-0.360825, y: 0.2248015, id: 1),
            makePoint(-0.2878165, y: 0.2476588, id: 1),
            makePoint(-0.2087822, y: 0.2476588, id: 1),
            makePoint(-0.1297479, y: 0.2476588, id: 1),
            makePoint(-0.05088839, y: 0.2427556, id: 1),
            makePoint(0.02729833, y: 0.2316795, id: 1),
            makePoint(0.1051337, y: 0.2180121, id: 1),
            makePoint(0.181834, y: 0.2026275, id: 1),
            makePoint(0.2590845, y: 0.185948, id: 1),
            makePoint(0.3364351, y: 0.1718835, id: 1),
            makePoint(0.4081015, y: 0.1404066, id: 1),
            makePoint(0.469284, y: 0.09373301, id: 1),
            makePoint(0.5114879, y: 0.03065085, id: 1),
            makePoint(0.5237793, y: -0.04329216, id: 1),
            makePoint(0.4753055, y: -0.1001781, id: 1),
            makePoint(0.4070099, y: -0.1396003, id: 1),
            makePoint(0.3387244, y: -0.1791354, id: 1),
            makePoint(0.2612249, y: -0.1931278, id: 1),
            makePoint(0.1827857, y: -0.2010163, id: 1),
            makePoint(0.1042808, y: -0.210134, id: 1),
            makePoint(0.02574384, y: -0.2173093, id: 1),
            makePoint(-0.05038932, y: -0.2367243, id: 1),
            makePoint(-0.1259023, y: -0.2555259, id: 1)
        ])
    }
    
    func makePointCloud(name: String, points: [AnyObject]) -> (DollarPointCloud){
        var pointCloud : DollarPointCloud = DollarPointCloud(name: name, points:points)
        return pointCloud
    }
    
    func makePoint(x: Float, y: Float, id: Int) -> (DollarPoint) {
        return DollarPoint(id: id, x: x, y: y)
    }
}