//
//  JLDetailViewController.m
//  TestProgram1
//
//  Created by Student on 08.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "JLDetailViewController.h"

@interface JLDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *userTweetLabel;

@end

@implementation JLDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userTweetLabel.text = self.userTweetText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end