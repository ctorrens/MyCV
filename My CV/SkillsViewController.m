//
//  SkillsViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-25.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "SkillsViewController.h"
#include "LabelFormat.h"

@interface SkillsViewController ()

@end

@implementation SkillsViewController

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
    

#pragma mark - Label Format
    
    //---------------Label Format ---------------------
    LabelFormat * titleView = [[LabelFormat alloc] initWithFrame:CGRectZero];
    titleView.text = @"My Skills";
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    //-------------------------------------------------
    
    
#pragma mark - Filling text view with json content
    id dataObject = self.resumeListArray[0];

    NSDictionary *skillSet = dataObject[@"Skills"];
    NSString * skillsRaw = skillSet[@"Programming"];
    NSString * skillSection = [NSString stringWithFormat:@"\nProgramming:\n%@\n",skillsRaw];
    NSString * skills = skillSection;

    
    skillsRaw = skillSet[@"Practices"];
    skillSection = [NSString stringWithFormat:@"\nPractices:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];

    
    skillsRaw = skillSet[@"Mobile"];
    skillSection = [NSString stringWithFormat:@"\nMobile:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];

    
    skillsRaw = skillSet[@"Networking"];
    skillSection = [NSString stringWithFormat:@"\nNetworking:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];

    
    skillsRaw = skillSet[@"Protocols"];
    skillSection = [NSString stringWithFormat:@"\nProtocols:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];

    
    skillsRaw = skillSet[@"Directories"];
    skillSection = [NSString stringWithFormat:@"\nDirectories:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];

    
    skillsRaw = skillSet[@"Virtualization"];
    skillSection = [NSString stringWithFormat:@"\nVirtualization:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    skillsRaw = skillSet[@"Antivirus"];
    skillSection = [NSString stringWithFormat:@"\nAntivirus:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    skillsRaw = skillSet[@"BackUP"];
    skillSection = [NSString stringWithFormat:@"\nBack Up:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    skillsRaw = skillSet[@"OS"];
    skillSection = [NSString stringWithFormat:@"\nOS:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    skillsRaw = skillSet[@"Databases"];
    skillSection = [NSString stringWithFormat:@"\nDatabases:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    skillsRaw = skillSet[@"Project"];
    skillSection = [NSString stringWithFormat:@"\nProjects:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    

    skillsRaw = skillSet[@"SDKs"];
    skillSection = [NSString stringWithFormat:@"\nSDKs:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    

    skillsRaw = skillSet[@"Other"];
    skillSection = [NSString stringWithFormat:@"\nOther:\n%@\n",skillsRaw];
    skills = [skills stringByAppendingString:skillSection];
    
    
    self.skills.text = skills;
    self.skills.textColor = [UIColor grayColor];
    

    for (id objects in self.resumeListArray) {
        
    }
    
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
