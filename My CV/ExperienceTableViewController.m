//
//  ExperienceTableViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "ExperienceTableViewController.h"
#include "LabelFormat.h"
#include "ExperienceDetailsTableViewController.h"

@interface ExperienceTableViewController ()<UITableViewDelegate>


@end

@implementation ExperienceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewWillDisappear:(BOOL)animated{

    NSLog(@"\n\n\n View will disappear\n\n\n");
    
}
-(void)viewWillAppear:(BOOL)animated{

    NSLog(@"\n\n\n View will appear\n\n\n");

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"\n\n\nView DID appear\n\n\n");
    
#pragma mark - Label Format
    //---------------Label Format ---------------------
    LabelFormat * titleView = [[LabelFormat alloc] initWithFrame:CGRectZero];
    titleView.text = @"My experience";
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
	//-------------------------------------------------
    

    
    // Loading images into an array to then show them up after
//    NSInteger numberOfRows = self.experienceListArray.count-1;
//    id dataObject ;
//    NSString * imageName;
//    NSString * finalImageURL;
//    NSURL *url;
//    NSData * data;
//    NSMutableArray *images = [[NSMutableArray alloc]init];
//    
//    for (int indx = 0; indx <= numberOfRows; indx++) {
//        dataObject = self.experienceListArray[indx];
//        imageName = dataObject[@"Logo"];
//        finalImageURL = [NSString stringWithFormat:@"http://www.creationware.ca/%@%@",imageName,@".ico"];
//        url = [NSURL URLWithString:finalImageURL];
//        data = [[NSData alloc]initWithContentsOfURL:url];
//        UIImage *img = [[UIImage alloc]initWithData:data];
//       
//        if (img !=nil) {
//           [images addObject:img];
//            NSLog(@"Added one image: %@ ",imageName);
//        }
//        
//    }
    //------------------------------------------------------------

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    NSInteger indx = self.experienceListArray.count;
    NSLog(@"number of rows in section : %ld",(long)indx);
    return indx;


}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger row = indexPath.row;
    id dataObject = self.experienceListArray[row];
    static NSString *CellIdentifier = @"experienceCell";
    ExperienceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.companyLabel.text = dataObject[@"Company"];
    cell.positionLabel.text = dataObject[@"Position"];
    cell.periodLabel.text =dataObject[@"Period"];


    NSString * imageName = dataObject[@"Logo"];
    NSString * finalImageURL = [NSString stringWithFormat:@"http://www.creationware.ca/%@%@",imageName,@".ico"];
    NSURL *url = [NSURL URLWithString:finalImageURL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * response,
                                               NSData * data,
                                               NSError * error) {
                               if (!error){
                                   
                                   cell.image.image = [UIImage imageWithData:data];
                                  
                               }
                               
                           }];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"ToExperienceDetails" sender:self];
    NSLog(@"\n\nExperience list at selected row AT INDEX:%ld is:\n %@ ",(long)indexPath.row,self.experienceListArray[[indexPath row]]);
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([[segue identifier] isEqualToString:@"ToExperienceDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
		UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        ExperienceDetailsTableViewController *destinationVC = [[navigationController viewControllers] lastObject];
        NSLog(@"\n\nINDEXPATH:%ld \n\n",(long)[indexPath row]);
        destinationVC.experienceObject= self.experienceListArray[[indexPath row]];
    }

}

-(IBAction)backFromExperienceDetails:(UIStoryboardSegue *)segue{
    
}


//- (IBAction)BackIndex:(UIBarButtonItem *)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
@end
