//
//  SECLoginViewController.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/21/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SECLoginViewController : UIViewController <UITextFieldDelegate>
- (IBAction)loginClicked:(id)sender;
- (void) establishConnection;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) NSURLConnection *connection;

@end
