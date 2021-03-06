//
//  MainViewController.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexTableViewController.h"
#import "MBProgressHUD.h"

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)viewMyCV:(UIButton *)sender;
@property(nonatomic, strong) NSArray *experienceListArray;
@property(nonatomic, strong) NSArray *resumeListArray;
@property(nonatomic) BOOL jsonFetched;

@property (strong, nonatomic) IBOutlet UILabel *myName;
@property (strong, nonatomic) IBOutlet AutoScrollLabel *myTitle;
@property (strong, nonatomic) IBOutlet UIImageView *myPicture;
@property (strong, nonatomic) IBOutlet UITextField *remoteHostStatusField;




@end
