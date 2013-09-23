//
//  ExperienceCell.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-22.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExperienceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
