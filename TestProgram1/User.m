//
//  User.m
//  TestProgram1
//
//  Created by Student on 01.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userID;
@synthesize name;
@synthesize avatar;
@synthesize registerDate;

- (id) init {
    return [self initWithData:nil userName:nil userAvatar:nil registerDate:nil];
}

- (id) initWithData : (NSNumber *) uID
           userName : (NSString *) uName
         userAvatar : (NSURL *) uAvatar
       registerDate : (NSDate *) rDate {
    self = [super init];
    if (self) {
        self.userID = uID;
        self.name = uName;
        self.avatar = uAvatar;
        self.registerDate = rDate;
    }
    return self;
}

+ (id) user {
    return [[User alloc] init];
}

+ (id) userWithData : (NSNumber *) uID
           userName : (NSString *) uName
         userAvatar : (NSURL *) uAvatar
       registerDate : (NSDate *) rDate {
    return [[User alloc] initWithData:uID userName:uName userAvatar:uAvatar registerDate:rDate];
}

#define    kUserIDKey           @"UserID"
#define    kUserNameKey         @"UserName"
#define    kUserAvatarKey       @"UserAvatar"
#define    kUserRegisterDateKey @"UserRegisterDate"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: userID forKey:kUserIDKey];
    [encoder encodeObject: name forKey:kUserNameKey];
    [encoder encodeObject: avatar forKey:kUserAvatarKey];
    [encoder encodeObject: registerDate forKey:kUserRegisterDateKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        userID = [decoder decodeObjectForKey:kUserIDKey];
        name = [decoder decodeObjectForKey:kUserNameKey];
        avatar = [decoder decodeObjectForKey:kUserAvatarKey];
        registerDate = [decoder decodeObjectForKey:kUserRegisterDateKey];
    }
    return self;
}

@end
