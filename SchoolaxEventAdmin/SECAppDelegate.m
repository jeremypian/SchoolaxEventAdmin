//
//  SECAppDelegate.m
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 2/19/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import "SECAppDelegate.h"
#import "SECTableViewController.h"
#import "SECAttendanceViewController.h"


@implementation SECAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    /*
    UINavigationController* navController=[[UINavigationController alloc] init];
    SECTableViewController *firstController=[[SECTableViewController alloc] init];
    [navController pushViewController:firstController animated:NO];
    [self.window addSubview: navController.view];
     */
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
    UIViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:rvc];
    [[self window] setRootViewController:self.navigationController];
    
    //template code
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
