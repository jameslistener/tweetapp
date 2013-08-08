//
//  JLTableViewCell.m
//  TestProgram1
//
//  Created by Student on 08.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "JLTableViewCell.h"

@implementation JLTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
