//
//  SECViewController.m
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/19/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import "SECAttendanceViewController.h"
#import "SECLoginViewController.h"
#import "AFNetworking/AFJSONRequestOperation.h"
#import "SECAppData.h"
#import "MBProgressHUD.h"

@interface SECAttendanceViewController ()

@end

@implementation SECAttendanceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAttendees];
}

- (void)loadAttendees
{
    NSLog(@"Loading!");
    
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/get-event-attendees/", [[SECAppData getInstance] serverUrl]]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = [[NSString alloc] initWithFormat:@"username=%@&password=%@&event_id=%@", self.username, self.password, self.eventId];
    NSLog(@"%@", postString);
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Got response");
        NSLog(@"names: %@", JSON[@"attendees"]);
        self.dataArray = JSON[@"attendees"];
        [self.eventList reloadData];
    } failure:nil];
    
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanCode:(id)sender {
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentViewController:reader animated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    NSLog(@"captured data");
    NSLog(@"%@", info);
    
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    // EXAMPLE: do something useful with the barcode data
    attendee_username = symbol.data;
    [reader dismissViewControllerAnimated:YES completion:nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User Check-in"
                                                    message:[[NSString alloc] initWithFormat:@"Are you sure you want to %@ in to this event?", attendee_username]
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
    ;
    // populate resultText and resultImage
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes"])
    {
        // Check the user in
        NSLog(@"Checking user %@ in.", attendee_username);
        
        // Do any additional setup after loading the view, typically from a nib.
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/checkin", [[SECAppData getInstance] serverUrl]]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"POST"];
        NSString *postString = [[NSString alloc] initWithFormat:@"username=%@&password=%@&event_id=%@&attendee_username=%@", self.username, self.password, self.eventId, attendee_username];
        NSLog(@"%@", postString);
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSLog(@"Status: %@", JSON[@"status"]);

        } failure:nil];
        [operation start];
        // Reload the attendees table
        [self loadAttendees];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [self.dataArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"More text";
    cell.imageView.image = [UIImage imageNamed:@"flower.png"];
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
@end
