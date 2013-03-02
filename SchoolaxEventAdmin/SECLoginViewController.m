//
//  SECLoginViewController.m
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/21/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import "SECLoginViewController.h"
#import "SECTableViewController.h"
#import "SECAppData.h"
#import "AFNetworking/AFJSONRequestOperation.h"

@interface SECLoginViewController ()

@end

@implementation SECLoginViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClicked:(id)sender {
    NSLog(@"%@", self.usernameField.text);
    NSLog(@"%@", self.passwordField.text);
    [self establishConnection];
    SECAppData* data = [SECAppData getInstance];
    [data setUsername:self.usernameField.text];
    [data setPassword:self.passwordField.text];
    [self dismissViewControllerAnimated:YES completion:nil];

    /*
    SECAttendanceViewController *attendance = [[SECAttendanceViewController alloc] init];
    attendance.username = [[NSString alloc] initWithString:self.usernameField.text];
    attendance.password = [[NSString alloc] initWithString:self.passwordField.text];
    [self.navigationController pushViewController:attendance animated:YES];
     */
}

- (void) establishConnection
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://127.0.0.1:8000/login/"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = [NSString stringWithFormat:@"username=%@&password=%@", self.usernameField.text, self.passwordField.text] ;
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnstring=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"%@",returnstring);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection success.");
}

/*---------------------------------------------------------------------------
 * URL connection fail
 *--------------------------------------------------------------------------*/
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failure.");
}


- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"Authentication challenge received");
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}


@end
