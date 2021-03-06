//
//  QualificationsViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-25.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "QualificationsViewController.h"
#include "LabelFormat.h" 
@interface QualificationsViewController ()

@end

@implementation QualificationsViewController

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
	// Do any additional setup after loading the view.

    //---------------Label Format ---------------------
    
    LabelFormat * titleView = [[LabelFormat alloc] initWithFrame:CGRectZero];
    titleView.text = @"My Qualifications";
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    
    //-------------------------------------------------

    
    NSDictionary * resume =self.resumeListArray[0];
    NSString * qualificationsRaw = resume[@"Qualifications"];
    NSString * qualifications = [qualificationsRaw stringByReplacingOccurrencesOfString:@";" withString:@"\n\n"];
    self.qualifications.text = qualifications;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)BackIndex:(UIBarButtonItem *)sender {
//      [self dismissViewControllerAnimated:YES completion:nil];
//}
@end
