//
//  ExperienceDetailsTableViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-27.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "ExperienceDetailsTableViewController.h"
#include "LabelFormat.h"

@interface ExperienceDetailsTableViewController ()

@end

@implementation ExperienceDetailsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark - Label Format
    //---------------Label Format ---------------------
	LabelFormat * titleView = [[LabelFormat alloc] initWithFrame:CGRectZero];
    titleView.text = @"Experience Details";
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    //-------------------------------------------------

    //--------LOGO PRocessing--------------------------
    
    NSString * imageName = self.experienceObject[@"Logo"];
    NSString * finalImageURL = [NSString stringWithFormat:@"http://www.creationware.ca/%@%@",imageName,@".ico"];
    NSURL *url = [NSURL URLWithString:finalImageURL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * response,
                                               NSData * data,
                                               NSError * error) {
                               if (!error){
                                   
                                   self.logo.image = [UIImage imageWithData:data];
                                   
                               }
                               
                           }];
    
    //-------------------------------------------------
    
    
    self.company.text = self.experienceObject[@"Company"];
    self.period.text = self.experienceObject[@"Period"];
    self.location.text = self.experienceObject[@"Location"];
    self.position.text = self.experienceObject[@"Position"];
    self.environment.text = self.experienceObject[@"Environment"];
    self.tasks.text = self.experienceObject[@"Tasks"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
