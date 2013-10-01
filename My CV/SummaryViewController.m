//
//  SummaryViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-25.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

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
    NSDictionary * resume =self.resumeListArray[0];
    
    NSString * summaryRaw = resume[@"Summary"];
    
    NSString * summary = [summaryRaw stringByReplacingOccurrencesOfString:@";" withString:@"\n\n"];
    
    self.summary.text = summary;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackIndex:(UIBarButtonItem *)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}
@end
