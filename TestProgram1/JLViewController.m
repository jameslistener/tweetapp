//
//  ViewController.m
//  TestProgram1
//
//  Created by Student on 29.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tweetList = [[Tweets alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateTweets: (UIButton *)sender {
    [self.tweetList updateTweets];
    self.tweetsNumber.text = [NSString stringWithFormat: @"Tweets (%d) :", self.tweetList.count];
    OneTweet *tmpTweet = [self.tweetList getTweet : 0];
    self.tweetAuthor.text = tmpTweet.author.name;
    self.tweetText.text = tmpTweet.text;
    self.tweetPublished.text = [NSString stringWithFormat: @"%@", tmpTweet.date];
    self.tweetID.text = [NSString stringWithFormat: @"%@", tmpTweet.tweetID];
}

@end
