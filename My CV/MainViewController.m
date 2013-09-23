//
//  MainViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self.activityIndicator startAnimating];

    // load experience
    NSURL *experienceListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresume.js"];
    NSData *experienceListAsData = [NSData dataWithContentsOfURL:experienceListJSONURL];
    self.experienceListArray = [NSJSONSerialization JSONObjectWithData:experienceListAsData options:0 error:nil];
    NSLog(@"I loaded %i experiences from the JSON file",_experienceListArray.count);
    
    //load rest of resume
    NSURL *resumeListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresume.js"];
    NSData *resumeListAsData = [NSData dataWithContentsOfURL:resumeListJSONURL];
    self.resumeListArray = [NSJSONSerialization JSONObjectWithData:resumeListAsData options:0 error:nil];
    NSLog(@"I loaded %i experiences from the JSON file",_experienceListArray.count);
    
    
    
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewMyCV:(UIButton *)sender {
    NSLog(@"Clicked");
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


}

@end
