//
//  SECViewController.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/19/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SECViewController : UIViewController < ZBarReaderDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *eventList;

@property (strong, nonatomic) NSArray *dataArray;

- (IBAction)scanCode:(id)sender;
@end
