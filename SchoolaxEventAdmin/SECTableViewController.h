//
//  SECTableViewController.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 3/1/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SECTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableView *eventList;

@property (strong, nonatomic) NSArray *eventNames;
@property (strong, nonatomic) NSArray *eventIds;

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@property (nonatomic) BOOL isAuthenticated;

- (void) loadEvents;
@end
