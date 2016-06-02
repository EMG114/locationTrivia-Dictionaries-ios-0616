//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {

    NSString *name = location[@"name"];
    if ( [name length] > length ) {
        name = [name substringToIndex:length];
        return name;
    } else {
        return name;
    }
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSMutableDictionary *nDictionary = [[NSMutableDictionary alloc] init];
    [nDictionary setValue:name forKey:@"name"];
    [nDictionary setValue:@(latitude) forKey:@"latitude"];
    [nDictionary setValue:@(longitude) forKey:@"longitude"];
    return nDictionary;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *arryOfLocations = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *nameOfLocation = location[@"name"];
        [arryOfLocations addObject:nameOfLocation];
    }
    return arryOfLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    if ([keys count] != 3) {
        return false;
    } else if ([keys containsObject: @"name"] && [keys containsObject: @"latitude"] && [keys containsObject: @"longitude"]) {
        return true;
    } else {
        return false;
    }
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqual:name]) {
            return location;
        }
    }
    return nil;
}










@end
