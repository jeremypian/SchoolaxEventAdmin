//
//  SECViewController.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/19/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SECAttendanceViewController : UIViewController < ZBarReaderDelegate, UITableViewDataSource>{
    NSString* eventId;
}
- (id)initWithEventId:(NSString*)_eventId;

@property (weak, nonatomic) IBOutlet UITableView *eventList;

@property (strong, nonatomic) NSArray *dataArray;

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@property (nonatomic) BOOL isAuthenticated;

- (void) loadAttendees;
- (IBAction)scanCode:(id)sender;
@end
