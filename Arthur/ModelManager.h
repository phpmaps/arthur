//
//  ModelManager.h
//  Arthur
//
//  Created by Doug Carroll on 9/1/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeaderDataObject.h"

@interface ModelManager : NSObject

@property (strong,nonatomic) NSMutableArray *leadersArray;

-(void)setupLeadersFromJSONArray:(NSMutableData*)dataFromServerArray;
-(void)setupLeadersFromDictionary:(NSDictionary*)dictionary;



@end
