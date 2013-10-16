//
//  MainViewController.m
//  My CV
//
//  Created by Claudio Torrens on 2013-09-19.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import "MainViewController.h"
#import "Reachability.h"

@interface MainViewController ()

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) NSURL *experienceListJSONURL;
@property (nonatomic) NSURL *resumeListJSONURL;
@property (nonatomic) BOOL isConnected;

@end

@implementation MainViewController



#pragma mark - Network connectivity

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	[self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.hostReachability)
	{
		[self configureTextField:self.remoteHostStatusField reachability:reachability];
//        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
 //       self.summaryLabel.hidden = (netStatus != ReachableViaWWAN);
        NSString* baseLabelText = @"";
        
        if (connectionRequired)
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }

    }
    

}


- (void)configureTextField:(UITextField *)textField reachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            self.isConnected = NO;
                       /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            statusString = NSLocalizedString(@"Reachable WWAN", @"");
            self.isConnected = YES;
            break;
        }
        case ReachableViaWiFi:        {
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            self.isConnected = YES;
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    textField.text= statusString;
}

#pragma mark - View Controller Code

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
    
    self.isConnected = NO;
    
    //-----------Reachability Code-------------------------------
    // Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the method reachabilityChanged will be called.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    // server to monitor connection
    NSString *remoteHostName = @"www.creationware.ca";
    
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];

   
    //-----------END Reachability Code-------------------------------
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewMyCV:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading...";
    hud.detailsLabelText = @"...";
    
    
    if (self.isConnected) {
        
        NSLog(@"It IS CONNECTED");
        self.experienceListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresume.js"];
        self.resumeListJSONURL = [NSURL URLWithString:@"http://www.creationware.ca/jsonresumerest.js"];
        
        
        
        if (self.jsonFetched==NO) {
            NSLog(@"jsonFetched==NO...");
            [self.activityIndicator setHidden:NO];
            [self.activityIndicator startAnimating];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"Loading...";
            NSDate *future = [NSDate dateWithTimeIntervalSinceNow: 0.06 ];
            [NSThread sleepUntilDate:future];
            // load experience
            NSURL *experienceListJSONURL = self.experienceListJSONURL;
            
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
            NSURL *resumeListJSONURL = self.resumeListJSONURL;
            
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
        
        
        
    } else {
          // Retrieve local JSONRESUME file called jsonresume.txt
        NSString *filePathResume = [[NSBundle mainBundle] pathForResource:@"jsonresumerest" ofType:@"txt"];
        // Load the file into an NSData object called JSONData
        NSError *error = nil;
        NSData *JSONDataResume = [NSData dataWithContentsOfFile:filePathResume options:NSDataReadingMappedIfSafe error:&error];
        // Create an Objective-C object from JSON Data
        id JSONObjectResume = [NSJSONSerialization JSONObjectWithData:JSONDataResume options:NSJSONReadingAllowFragments error:&error];
       
        if (JSONObjectResume==nil) {
            NSLog(@"\n\n Resume is empty\n\n");
        } else {

            self.resumeListArray = JSONObjectResume;
        }
        

        // Retrieve local JSONRESUME file called jsonresume.txt
        NSString *filePathResumeRest = [[NSBundle mainBundle] pathForResource:@"jsonresume" ofType:@"txt"];
        // Load the file into an NSData object called JSONData
        NSData *JSONDataResumeRest = [NSData dataWithContentsOfFile:filePathResumeRest options:NSDataReadingMappedIfSafe error:&error];
        // Create an Objective-C object from JSON Data
        id JSONObjectResumeRest = [NSJSONSerialization JSONObjectWithData:JSONDataResumeRest options:NSJSONReadingAllowFragments error:&error];

        if (JSONObjectResumeRest==nil) {
            NSLog(@"\n\n ResumeRest is empty \n\n");
        } else {

            self.self.experienceListArray = JSONObjectResumeRest;
        }
    
        if (self.resumeListArray!=nil && self.experienceListArray!=nil) {
            
            NSLog(@"\n\n ResumeRest is : %@ \n\n",self.experienceListArray);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.activityIndicator stopAnimating];
            [self.activityIndicator setHidden:YES];
            [self performSegueWithIdentifier: @"ToIndex" sender: self];
        }
        
        
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
