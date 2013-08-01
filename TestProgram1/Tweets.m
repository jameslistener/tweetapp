//
//  Tweets.m
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "Tweets.h"
#import "OneTweet.h"

@implementation Tweets

- (id) init {
    return [self initWithTweets: [NSArray array]];
}

- (id) initWithTweets : (NSArray *)newTweets {
    self.tweetArray = newTweets;
    self.count = newTweets.count;
    return self;
}

- (void) updateTweets {
    // request tweets from net
    self.tweetArray = [NSArray arrayWithObjects:
                       [OneTweet tweetWithData : @1
                                          date : [NSDate dateWithTimeIntervalSince1970: 1000000]
                                          text : @"Hello, dude."
                                      authorID : @1],

                       [OneTweet tweetWithData : @2
                                          date : [NSDate dateWithTimeIntervalSince1970: 1000010]
                                          text : @"Hi, how are u?"
                                      authorID : @2],
                       
                       [OneTweet tweetWithData : @3
                                          date : [NSDate dateWithTimeIntervalSince1970: 1000017]
                                          text : @"Fine, thx."
                                      authorID : @1],
                       
                       [OneTweet tweetWithData : @4
                                          date : [NSDate dateWithTimeIntervalSince1970: 1000035]
                                          text : @"'Sup, guys?."
                                      authorID : @3],
                       
                       [OneTweet tweetWithData : @5
                                          date : [NSDate dateWithTimeIntervalSince1970: 1000051]
                                          text : @"Nothing, dude."
                                      authorID : @2],
                       
                       nil];
    self.count = self.tweetArray.count;
}
@end