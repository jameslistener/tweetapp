//
//  ViewController.h
//  TestProgram1
//
//  Created by Student on 29.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweets.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tweetsNumber;
@property (weak, nonatomic) IBOutlet UILabel *tweetAuthor;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *tweetPublished;
@property (weak, nonatomic) IBOutlet UILabel *tweetID;
@property (strong, nonatomic) Tweets *tweetList;
- (IBAction)updateTweets: (UIButton *)sender;
@end
