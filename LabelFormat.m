//
//  LabelFormat.m
//  My CV
//
//  Created by Claudio Torrens on 2013-10-03.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "LabelFormat.h"

@implementation LabelFormat

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont boldSystemFontOfSize:20.0];
        self.shadowColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        self.shadowOffset = CGSizeMake(0.0f, 1.0f);
        self.textColor = [UIColor colorWithRed:47.0/255.0 green:120.0/255.0 blue:220.0/255.0 alpha:.9];
        
    }
    
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
