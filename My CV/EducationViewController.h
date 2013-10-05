//
//  EducationViewController.h
//  My CV
//
//  Created by Claudio Torrens on 2013-09-25.
//  Copyright (c) 2013 Claudio Torrens. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EducationViewController : UIViewController
//- (IBAction)BackIndex:(UIBarButtonItem *)sender;
@property(nonatomic, strong) NSArray *resumeListArray;
@property (weak, nonatomic) IBOutlet UITextView *education;

@end
