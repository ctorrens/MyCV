//
//  IndexTableViewController.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExperienceTableViewController.h"
#import "SummaryViewController.h"
#import "QualificationsViewController.h"
#import "SkillsViewController.h"
#import "EducationViewController.h"
#include "AutoScrollLabel.h" // Customized ScrollableView



@interface IndexTableViewController : UITableViewController<UIPageViewControllerDelegate,UITableViewDelegate>

@property(nonatomic, strong) NSArray *experienceListArray;
@property(nonatomic, strong) NSArray *resumeListArray;
- (IBAction)BackMain:(UIBarButtonItem *)sender;
-(IBAction)backFromExit:(UIStoryboardSegue *)segue;

@property (weak, nonatomic) IBOutlet UILabel *skillsLabel;
@property (weak, nonatomic) IBOutlet UILabel *qualificationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *experienceLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;



//@property (weak, nonatomic) IBOutlet AutoScrollLabel *autoScrollLabel;


@end
