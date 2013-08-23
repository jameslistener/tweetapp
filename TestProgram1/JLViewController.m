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
#import <AFJSONRequestOperation.h>
#import <NSDate+SSToolkitAdditions.h>
#import <Foundation/NSJSONSerialization.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>


@interface JLViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tweetsTableView;

@end



@implementation JLViewController

#define kFilename         @"tweetapp_data"
#define kDataKey          @"last_tweets"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tweetList = [[Tweets alloc] init];
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.tweetList = [unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding];
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:app];
    
    [self.tweetsTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}


- (IBAction)updateTweets: (UIButton *)sender {
    // request tweets from net
    
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier: ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
            
            if ([arrayOfAccounts count] > 0) {
                ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                [self requestTweets:twitterAccount];
            }
        }
        else {
            NSLog(@"Error in request access to account, number '%d'.", error.code);
        };
    }];
}

- (void) requestTweets: (ACAccount *)twitterAccount {
    NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
    SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                requestMethod:SLRequestMethodGET
                                                          URL:requestURL
                                                   parameters:@{@"count": @"20"}];
    postRequest.account = twitterAccount;
    [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
        self.tweetList.tweetArray = [self deserializeDataFromTwitter:responseData];
        [self updateTweetTable];
    }];
}

- (void) updateTweetTable {
    self.tweetsNumber.text = [NSString stringWithFormat: @"%d New", self.tweetList.tweetArray.count];
    [self.tweetsTableView reloadData];
}

- (NSArray *) deserializeDataFromTwitter: (NSData *)dataFromTwitter {
    NSError *e = nil;
    NSArray *jsonTweets = [NSJSONSerialization JSONObjectWithData:dataFromTwitter
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
    return tmpTweets;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tweetsTableView deselectRowAtIndexPath:[self.tweetsTableView indexPathForSelectedRow] animated:YES];
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.tweetList forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetList.tweetArray.count;
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
