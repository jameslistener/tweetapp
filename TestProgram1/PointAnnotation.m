//
//  PointAnnotation.m
//  TestProgram1
//
//  Created by JamesListener on 8/23/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "PointAnnotation.h"

@implementation PointAnnotation

- (NSString *)title {
    return @"Bryansk City";
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.25;
    coordinate.longitude = 34.36666;
    return coordinate;
}

@end