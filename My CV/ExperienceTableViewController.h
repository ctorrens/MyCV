//
//  ExperienceTableViewController.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ExperienceCell.h"

@interface ExperienceTableViewController : UITableViewController
@property(nonatomic, strong) NSArray *experienceListArray;
@property(nonatomic, strong) NSArray *resumeListArray;
- (IBAction)BackIndex:(UIBarButtonItem *)sender;
@end

