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
   
    //NSLog(@"I loaded %lu experiences from the JSON file",(unsigned long)_experienceListArray.count);
    
    //load rest of resume
    NSURL *resumeListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresumerest.js"];
    NSData *resumeListAsData = [NSData dataWithContentsOfURL:resumeListJSONURL];
    self.resumeListArray = [NSJSONSerialization JSONObjectWithData:resumeListAsData options:0 error:nil];
    NSLog(@"I loaded %lu segments of resume from the JSON file",(unsigned long)_resumeListArray.count);
    
    
    //------------------------
    
    id dataObject = self.resumeListArray[0];
    NSString *summary = dataObject[@"Summary"];
    NSDictionary *skill = dataObject[@"Skills"];
    
   // NSLog(@"Summary is: %@", summary);
   // NSLog(@"Skills is : %@",skill[@"Antivirus"]);
    
    //------------------------
    
    
    
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
    
    [self performSegueWithIdentifier: @"ToIndex" sender: self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([[segue identifier] isEqualToString:@"ToIndex"]) {
   //     IndexTableViewController *destinationVC = segue.destinationViewController;
	
        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        IndexTableViewController *destinationVC = [[navigationController viewControllers] lastObject];
        
        
        destinationVC.resumeListArray= self.resumeListArray;
        destinationVC.experienceListArray = self.experienceListArray;
    }

}

@end
