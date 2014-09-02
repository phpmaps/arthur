//
//  ModelManager.m
//  Arthur
//
//  Created by Doug Carroll on 9/1/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "ModelManager.h"

@implementation ModelManager

@synthesize leadersArray;

-(void)setupLeadersFromJSONArray:(NSMutableData*)dataFromServerArray{
    NSError *error;
    leadersArray = [[NSMutableArray alloc] init];
    NSArray *arrayFromServer = [NSJSONSerialization JSONObjectWithData:dataFromServerArray options:0 error:&error];
    
    if(error){
        NSLog(@"error parsing the json data from server with error description - %@", [error localizedDescription]);
    }
    else {
        leadersArray = [[NSMutableArray alloc] init];
        for(NSDictionary *eachPerson in arrayFromServer)
        {
            // LeaderDataObject *person = [LeaderDataObject alloc] initWithJSONData:eachPerson];
            LeaderDataObject *person = [[LeaderDataObject alloc] initWithJSONData:eachPerson];
            [leadersArray addObject:person];
        }
        
        //Now you have your leadersArray filled up with all your data objects
    }
}

-(void)setupLeadersFromDictionary:(NSDictionary *)dictionary
{
    NSError *error;
    //NSMutableData *data = [[NSMutableData alloc] init];
    NSMutableData *dataFromDict = [NSJSONSerialization dataWithJSONObject:dictionary
                                                           options:NSJSONReadingAllowFragments
                                                             error:&error];
    [self setupLeadersFromJSONArray:dataFromDict];
}

@end
