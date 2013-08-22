//
//  ViewController.m
//  TestProgram1
//
//  Created by Student on 29.07.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "JLViewController.h"
#import "JLTableViewCell.h"
#import "JLDetailViewController.h"
#import "Tweets.h"
#import "OneTweet.h"
#import <UIImageView+AFNetworking.h>

@interface JLViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tweetsTableView;

@end



@implementation JLViewController

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
    [self.tweetList updateTweets : self.tweetsTableView numOfTweets: self.tweetsNumber doAfterUpdate : ^(UILabel *tweetsNumber, UITableView *tweetsTableView, NSArray *tweetArray) {
        tweetsNumber.text = [NSString stringWithFormat: @"%d New", tweetArray.count];
        [tweetsTableView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tweetsTableView deselectRowAtIndexPath:[self.tweetsTableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    JLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.nickNameLabel.text = ((OneTweet *)self.tweetList.tweetArray[indexPath.row]).author.name;
    cell.userTweetTextView.text = ((OneTweet *)self.tweetList.tweetArray[indexPath.row]).text;
    [cell.avatarImageView setImageWithURL: ((OneTweet *)self.tweetList.tweetArray[indexPath.row]).author.avatar placeholderImage: [UIImage imageNamed:@"placeholder"]];
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue"]) {
        JLDetailViewController *vc = (JLDetailViewController *)segue.destinationViewController;
        vc.userTweetText = ((OneTweet *)[self.tweetList.tweetArray objectAtIndex: [self.tweetsTableView indexPathForSelectedRow].row]).text;
    }
}


@end
