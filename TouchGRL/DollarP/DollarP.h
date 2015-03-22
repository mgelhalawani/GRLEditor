#import <Foundation/Foundation.h>
#import "DollarResult.h"
#import "DollarPoint.h"

extern int const DollarPNumPoints;

@interface DollarP : NSObject;

@property (nonatomic, strong) NSMutableArray *pointClouds;

+ (NSArray *)resample:(NSArray *)points numPoints:(int)numPoints;
+ (NSArray *)scale:(NSArray *)points;
+ (NSArray *)translate:(NSArray *)points to:(DollarPoint *)point;
+ (float)greedyCloudMatch:(NSArray *)points template:(NSArray *)template;
+ (float)cloudDistanceFrom:(NSArray *)points1 to:(NSArray *)points2 start:(int)start;

- (DollarResult *)recognize:(NSArray *)points;
- (void)addGesture:(NSString *)name points:(NSArray *)points;
- (void)setPointClouds:(NSMutableArray *)somePointClouds;

@end