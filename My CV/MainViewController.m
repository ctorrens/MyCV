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
    [self.activityIndicator setHidden:YES];
    self.jsonFetched = NO;
    self.myTitle.text = @"Informatoin Technology Specialist    ";
    self.myTitle.textColor = [UIColor blackColor];
    self.myTitle.font = [UIFont fontWithName:@"Arial" size:12.0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewMyCV:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading...";
    if (self.jsonFetched==NO) {
    NSLog(@"jsonFetched==NO...");
        [self.activityIndicator setHidden:NO];
        [self.activityIndicator startAnimating];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Loading...";
        NSDate *future = [NSDate dateWithTimeIntervalSinceNow: 0.06 ];
        [NSThread sleepUntilDate:future];
        // load experience
        NSURL *experienceListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresume.js"];
        NSURLRequest* request = [NSURLRequest requestWithURL:experienceListJSONURL];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse * response,
                                                   NSData * data,
                                                   NSError * error) {
                                   if (!error){
                                       self.experienceListArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                       if (self.resumeListArray!=nil && self.experienceListArray!=nil) {
                                           [MBProgressHUD hideHUDForView:self.view animated:YES];
                                           [self.activityIndicator stopAnimating];
                                           [self.activityIndicator setHidden:YES];
                                           [self performSegueWithIdentifier: @"ToIndex" sender: self];
                                       }
                                   }
                               }];
        //load rest of resume
        NSURL *resumeListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresumerest.js"];
        NSURLRequest* request2 = [NSURLRequest requestWithURL:resumeListJSONURL];
        [NSURLConnection sendAsynchronousRequest:request2
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse * response,
                                                   NSData * data,
                                                   NSError * error) {
                                   if (!error){
                                       self.resumeListArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                       NSLog(@"resumeListArray is: \n %@",self.resumeListArray);
                                       self.jsonFetched = YES;
                                        NSLog(@"I loaded %lu segments of resume from the JSON file",(unsigned long)_resumeListArray.count);
                                       if (self.resumeListArray!=nil && self.experienceListArray!=nil) {
                                           [MBProgressHUD hideHUDForView:self.view animated:YES];
                                           [self.activityIndicator stopAnimating];
                                           [self.activityIndicator setHidden:YES];
                                           [self performSegueWithIdentifier: @"ToIndex" sender: self];
                                       }
                                   }
                               }];
    }
    if (self.resumeListArray!=nil && self.experienceListArray!=nil) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidden:YES];
        [self performSegueWithIdentifier: @"ToIndex" sender: self];
    }
}

-(void)viewWillAppear:(BOOL)animated{

    animated=YES;
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if ([[segue identifier] isEqualToString:@"ToIndex"]) {
        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        IndexTableViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;
        destinationVC.experienceListArray = self.experienceListArray;
    }

}

@end
