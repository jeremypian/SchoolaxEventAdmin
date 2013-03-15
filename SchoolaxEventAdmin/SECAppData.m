//
//  SECAppData.m
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 3/2/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import "SECAppData.h"

@implementation SECAppData
@synthesize username;
@synthesize password;
@synthesize serverUrl;
static SECAppData *instance =nil;
+(SECAppData *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [SECAppData new];
            //[instance setServerUrl:@"http://qa.schoolax.com"];
            [instance setServerUrl:@"http://127.0.0.1:8000"];
        }
    }
    return instance;
}
@end