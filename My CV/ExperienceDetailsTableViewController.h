//
//  ExperienceDetailsTableViewController.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-27.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExperienceDetailsTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UILabel *company;
@property (strong, nonatomic) IBOutlet UILabel *period;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *position;
@property (strong, nonatomic) IBOutlet UILabel *environment;
@property (strong, nonatomic) IBOutlet UITextView *tasks;
@property(nonatomic, strong) id experienceObject;

@end
