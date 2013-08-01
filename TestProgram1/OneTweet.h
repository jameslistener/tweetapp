//
//  OneTweet.h
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface OneTweet : NSObject
@property (strong, nonatomic) NSNumber *tweetID;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate   *date;
@property (strong, nonatomic) User *author;
+ (id) tweet;
+ (id) tweetWithData : (NSNumber *) tID
                date : (NSDate *) tDate
                text : (NSString *) tText
              author : (User *) a;
- (id) init;
- (id) initWithData : (NSNumber *) tID
               date : (NSDate *) tDate
               text : (NSString *) tText
             author : (User *) a;
@end