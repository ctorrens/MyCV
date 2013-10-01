//
//  IndexTableViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "IndexTableViewController.h"

@interface IndexTableViewController ()

@end

@implementation IndexTableViewController

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
 
    id resume = self.resumeListArray[0];
    NSDictionary *skillSet = resume[@"Skills"];
    NSString * skillsRaw = skillSet[@"Antivirus"];
    self.skillsLabel.text = skillsRaw;

    self.qualificationsLabel.text = resume[@"Qualifications"];
    
    NSString * summaryRaw = resume[@"Summary"];
    NSString * summary = [summaryRaw stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
    self.summaryLabel.text = summary;
    

    NSArray * experience = @[
                             [self.experienceListArray[0] objectForKey:@"Company"],
                             [self.experienceListArray[1] objectForKey:@"Company"],
                             [self.experienceListArray[2] objectForKey:@"Company"],
                             [self.experienceListArray[3] objectForKey:@"Company"],
                             [self.experienceListArray[4] objectForKey:@"Company"],
                             [self.experienceListArray[5] objectForKey:@"Company"],
                             [self.experienceListArray[6] objectForKey:@"Company"],
                             [self.experienceListArray[7] objectForKey:@"Company"],
                             [self.experienceListArray[8] objectForKey:@"Company"],
                             [self.experienceListArray[9] objectForKey:@"Company"],
                             ];

    NSString * exp = [NSString stringWithFormat:@"%@ - %@ - %@ - %@ - %@ - %@ - %@ - %@ - %@ - %@ ...",
                      [experience objectAtIndex:0],
                      experience[1],
                      experience[2],
                      experience[3],
                      experience[4],
                      experience[5],
                      experience[6],
                      experience[7],
                      experience[8],
                      experience[9]
                      ];
    
    self.experienceLabel.text = exp;
    
    self.educationLabel.text = resume[@"Education"];
    


    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //[self.hourglass startAnimating];
    //[self.hourglass setHidden:NO];
    NSLog(@"Prepare for segue");
    if ([[segue identifier] isEqualToString:@"ToExperience"]) {

		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        ExperienceTableViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;
        destinationVC.experienceListArray = self.experienceListArray;
    }
    

    if ([[segue identifier] isEqualToString:@"ToSummary"]) {
        
		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        SummaryViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;

    }

    if ([[segue identifier] isEqualToString:@"ToQualifications"]) {
        
		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        QualificationsViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;
        
    }

    if ([[segue identifier] isEqualToString:@"ToSkills"]) {
        
		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        SkillsViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;
        
    }
    
    if ([[segue identifier] isEqualToString:@"ToEducation"]) {
        
		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        EducationViewController *destinationVC = [[navigationController viewControllers] lastObject];
        destinationVC.resumeListArray= self.resumeListArray;
        
    }

    
}




-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  //  [self.hourglass setHidden:NO];
  //  [self.hourglass startAnimating];
    
    NSLog(@"Row has been selected");
    
    
}


- (IBAction)BackMain:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
