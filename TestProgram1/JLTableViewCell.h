//
//  JLTableViewCell.h
//  TestProgram1
//
//  Created by Student on 08.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *nickNameLabel;
@property(nonatomic, weak) IBOutlet UITextView *userTweetTextView;
@property(nonatomic, weak) IBOutlet UIImageView *avatarImageView;

@end
