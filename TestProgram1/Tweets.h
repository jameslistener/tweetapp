//
//  Tweets.h
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneTweet.h"

@interface Tweets : NSObject
@property (strong, nonatomic) NSArray *tweetArray;
@property (nonatomic) NSUInteger count;
- (id) init;
- (id) initWithTweets : (NSArray *)newTweets;
- (void) updateTweets : (UITableView *)tweetsTableView
          numOfTweets : (UILabel *)tweetsNumber
        doAfterUpdate : (void (^)(UILabel *tweetsNumber, UITableView *tweetsTableView, NSArray *tweetArray))doAfterUpdate;
- (OneTweet *) getTweet : (int) tweetN;
@end
