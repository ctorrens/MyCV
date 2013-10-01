//
//  SkillsViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-25.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "SkillsViewController.h"

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
    
    
    id dataObject = self.resumeListArray[0];
    NSDictionary *skillSet = dataObject[@"Skills"];
    NSString * skillsRaw = skillSet[@"Antivirus"];
   
    NSString * skills = [skillsRaw stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
    self.skills.text = skills;
    
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
