//
//  ExperienceCell.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-22.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "ExperienceCell.h"

@implementation ExperienceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
        NSLog(@"Cell init with Style ");
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];


    // Configure the view for the selected state
}

@end
