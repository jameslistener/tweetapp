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
                                          date : [NSDate dateWithTimeIntervalSince1970: 10000000]
                                          text : @"Hello, dude."
                                        author : [User userWithData : @1
                                                           userName : @"Alex"
                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900000]]],

                       [OneTweet tweetWithData : @2
                                          date : [NSDate dateWithTimeIntervalSince1970: 10000010]
                                          text : @"Hi, how are u?"
                                        author : [User userWithData : @2
                                                           userName : @"John"
                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900001]]],
                       
                       [OneTweet tweetWithData : @3
                                          date : [NSDate dateWithTimeIntervalSince1970: 10000017]
                                          text : @"Fine, thx."
                                        author : [User userWithData : @1
                                                           userName : @"Alex"
                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900000]]],
                       
                       [OneTweet tweetWithData : @4
                                          date : [NSDate dateWithTimeIntervalSince1970: 10000035]
                                          text : @"'Sup, guys?."
                                        author : [User userWithData : @3
                                                           userName : @"Peter"
                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900002]]],
                       
                       [OneTweet tweetWithData : @5
                                          date : [NSDate dateWithTimeIntervalSince1970: 10000051]
                                          text : @"Nothing, dude."
                                        author : [User userWithData : @2
                                                           userName : @"John"
                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900001]]],
                       
                       nil];
    self.count = self.tweetArray.count;
}

- (OneTweet *) getTweet:(int)tweetN {
    if (self.tweetArray.count != 0)
        return self.tweetArray[tweetN];
    else
        return nil;
}
@end