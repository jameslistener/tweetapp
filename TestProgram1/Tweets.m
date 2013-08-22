//
//  Tweets.m
//  TestProgram1
//
//  Created by Student on 31.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "Tweets.h"
#import "OneTweet.h"
#import <AFJSONRequestOperation.h>
#import <NSDate+SSToolkitAdditions.h>
#import <Foundation/NSJSONSerialization.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface Tweets ()

//@property STTwitter

@end

@implementation Tweets

- (id) init {
    return [self initWithTweets: [NSArray array]];
}

- (id) initWithTweets : (NSArray *)newTweets {
    self = [super init];
    if (self) {
        self.tweetArray = newTweets;
        self.count = newTweets.count;
    }
    return self;
}

- (void) updateTweets : (UITableView *)tweetsTableView
          numOfTweets : (UILabel *)tweetsNumber
        doAfterUpdate : (void (^)(UILabel *tweetsNumber, UITableView *tweetsTableView, NSArray *tweetArray))doAfterUpdate; {
    // request tweets from net
    
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier: ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType
                                     options:nil
                                  completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
            
            if ([arrayOfAccounts count] > 0) {
                ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                
                NSDictionary *params = @{@"count": @"20"};
                
                NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
                
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                            requestMethod:SLRequestMethodGET
                                                                      URL:requestURL
                                                               parameters:params];
                
                postRequest.account = twitterAccount;
                
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                    NSError *e = nil;
                    NSArray *jsonTweets = [NSJSONSerialization JSONObjectWithData:responseData
                                                                         options:NSJSONReadingMutableContainers
                                                                           error:&e];
                    NSMutableArray *tmpTweets = [[NSMutableArray alloc] init];
                    for (NSDictionary *tweet in jsonTweets) {
                        NSDictionary *user = [tweet valueForKey:@"user"];
                        [tmpTweets addObject:
                         [OneTweet tweetWithData:[tweet valueForKey:@"id"]
                                            date:[NSDate dateFromISO8601String:[tweet valueForKey:@"created_at"]]
                                            text:[tweet valueForKey:@"text"]
                                          author:[User userWithData:[user valueForKey:@"id"]
                                                           userName:[user valueForKey:@"name"]
                                                         userAvatar:[NSURL URLWithString:[user valueForKey:@"profile_image_url"]]
                                                       registerDate:[NSDate dateFromISO8601String:[user valueForKey:@"created at"]]]
                         ]
                        ];
                    }
                    self.tweetArray = tmpTweets;
                }];
            }
        }
        else {
            NSLog(@"Error in request access to account, number '%d'.", error.code);
        };
        doAfterUpdate(tweetsNumber, tweetsTableView, self.tweetArray);
    }];
    
//    self.tweetArray = [NSArray arrayWithObjects:
//                       [OneTweet tweetWithData : @1
//                                          date : [NSDate dateWithTimeIntervalSince1970: 10000000]
//                                          text : @"Hello, dude."
//                                        author : [User userWithData : @1
//                                                           userName : @"Alex"
//                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900000]]],
//
//                       [OneTweet tweetWithData : @2
//                                          date : [NSDate dateWithTimeIntervalSince1970: 10000010]
//                                          text : @"Hi, how are u?"
//                                        author : [User userWithData : @2
//                                                           userName : @"John"
//                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900001]]],
//                       
//                       [OneTweet tweetWithData : @3
//                                          date : [NSDate dateWithTimeIntervalSince1970: 10000017]
//                                          text : @"Fine, thx."
//                                        author : [User userWithData : @1
//                                                           userName : @"Alex"
//                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900000]]],
//                       
//                       [OneTweet tweetWithData : @4
//                                          date : [NSDate dateWithTimeIntervalSince1970: 10000035]
//                                          text : @"'Sup, guys?."
//                                        author : [User userWithData : @3
//                                                           userName : @"Peter"
//                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900002]]],
//                       
//                       [OneTweet tweetWithData : @5
//                                          date : [NSDate dateWithTimeIntervalSince1970: 10000051]
//                                          text : @"Nothing, dude."
//                                        author : [User userWithData : @2
//                                                           userName : @"John"
//                                                       registerDate : [NSDate dateWithTimeIntervalSince1970 : 9900001]]],
//                       
//                       nil];
    self.count = self.tweetArray.count;
}

- (OneTweet *) getTweet:(int)tweetN {
    if (self.tweetArray.count != 0)
        return self.tweetArray[tweetN];
    else
        return nil;
}
@end