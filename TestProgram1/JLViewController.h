//
//  ViewController.h
//  TestProgram1
//
//  Created by Student on 29.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweets.h"

@interface JLViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tweetsNumber;
@property (strong, nonatomic) Tweets *tweetList;
- (IBAction)updateTweets: (UIButton *)sender;

- (NSString *)dataFilePath;
- (void)applicationWillResignActive:(NSNotification *)notification;
@end
