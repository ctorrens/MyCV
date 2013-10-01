//
//  ExperienceTableViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "ExperienceTableViewController.h"

@interface ExperienceTableViewController ()<UITableViewDelegate,UITableViewDataSource>


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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)BackIndex:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
