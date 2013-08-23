//
//  OneTweet.m
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "OneTweet.h"

@implementation OneTweet

@synthesize tweetID;
@synthesize text;
@synthesize author;
@synthesize date;

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

#define    kTweetIDKey      @"TweetID"
#define    kTweetTextKey    @"TweetText"
#define    kTweetAuthorKey  @"TweetAuthor"
#define    kTweetDateKey    @"TweetDate"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: tweetID forKey:kTweetIDKey];
    [encoder encodeObject: text forKey:kTweetTextKey];
    [encoder encodeObject: author forKey:kTweetAuthorKey];
    [encoder encodeObject: date forKey:kTweetDateKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        tweetID = [decoder decodeObjectForKey:kTweetIDKey];
        text = [decoder decodeObjectForKey:kTweetTextKey];
        author = [decoder decodeObjectForKey:kTweetAuthorKey];
        date = [decoder decodeObjectForKey:kTweetDateKey];
    }
    return self;
}
@end
