//
//  OneTweet.m
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "OneTweet.h"

@implementation OneTweet
+ (id) tweet {
    return [[OneTweet alloc] init];
}

+ (id) tweetWithData : (NSNumber *)tID
                date : (NSDate *) tDate
                text : (NSString *) tText
              author : (User *) a {
    return [[OneTweet alloc] initWithData:tID date:tDate text:tText author:a];
}

- (id) init {
    return [self initWithData:nil date:nil text:nil author:nil];
}

- (id) initWithData : (NSNumber *)tID
               date : (NSDate *) tDate
               text : (NSString *) tText
             author : (User *) a {
    self = [super init];
    if (self) {
        self.tweetID = tID;
        self.date = tDate;
        self.text = tText;
        self.author = a;
    }
    return self;
}
@end
