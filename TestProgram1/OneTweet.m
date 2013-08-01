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
    return [[OneTweet alloc] initWithData:nil date:nil text:nil authorID:nil];
}

+ (id) tweetWithData : (NSNumber *)tID
                date : (NSDate *) tDate
                text : (NSString *) tText
            authorID : (NSNumber *) aID {
    return [[OneTweet alloc] initWithData:tID date:tDate text:tText authorID:aID];
}

- (id) init {
    return self = [[OneTweet alloc] initWithData:nil date:nil text:nil authorID:nil];
}

- (id) initWithData : (NSNumber *)tID
               date : (NSDate *) tDate
               text : (NSString *) tText
           authorID : (NSNumber *) aID {
    self.tweetID = tID;
    self.date = tDate;
    self.text = tText;
    self.authorID = aID;
    return self;
}
@end
