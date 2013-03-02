//
//  SECAppData.h
//  SchoolaxEventAdmin
//
//  Created by Jeremy Pian on 3/2/13.
//  Copyright (c) 2013 Jeremy Pian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SECAppData : NSObject {
    
    NSString *username;
    NSString *password;
    
}
@property(nonatomic,retain)NSString *username;
@property(nonatomic,retain)NSString *password;
+(SECAppData*)getInstance;
@end

