//
//  LeaderDataObject.h
//  Arthur
//
//  Created by Doug Carroll on 9/1/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeaderDataObject : NSObject



@property (strong) NSString *name;
@property (assign) NSInteger total;
@property (assign) NSInteger week;
@property (assign) NSInteger month;

-(id)initWithJSONData:(NSDictionary*)data;


@end
