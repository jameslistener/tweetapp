//
//  User.h
//  TestProgram1
//
//  Created by Student on 01.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic) NSNumber *userID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *registerDate;

- (id) init;
- (id) initWithData : (NSNumber *) uID
           userName : (NSString *) uName
       registerDate : (NSDate *) rDate;
+ (id) user;
+ (id) userWithData : (NSNumber *) uID
           userName : (NSString *) uName
       registerDate : (NSDate *) rDate;
@end
