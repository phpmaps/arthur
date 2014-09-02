//
//  LeaderDataObject.m
//  Arthur
//
//  Created by Doug Carroll on 9/1/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "LeaderDataObject.h"

@implementation LeaderDataObject


@synthesize name;
@synthesize total;
@synthesize week;
@synthesize month;

-(id)initWithJSONData:(NSDictionary*)data{
    self = [super init];
    if(self){
        //NSLog(@"initWithJSONData method called");
        
        self.name =  [data objectForKey:@"name"];
        self.total = [[data objectForKey:@"total"] integerValue];
        self.week = [[data objectForKey:@"week"] integerValue];
        self.month = [[data objectForKey:@"month"] integerValue];
    }
    return self;
}

- (id)init {
    // Forward to the "designated" initialization method
    return [self initWithJSONData:nil];
}

@end