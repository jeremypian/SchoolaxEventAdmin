//
//  SECViewController.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/19/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SECAttendanceViewController : UIViewController < ZBarReaderDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *eventList;

@property (strong, nonatomic) NSArray *dataArray;

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@property (nonatomic) BOOL isAuthenticated;

- (void) loadEvents;
- (IBAction)scanCode:(id)sender;
@end
