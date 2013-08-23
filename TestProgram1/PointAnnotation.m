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
    return @"Custom location";
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 55.74013097928981;
    coordinate.longitude = 37.609591484069824;
    return coordinate;
}

@end