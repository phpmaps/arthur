//
//  SecondViewController.h
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"
#import "ModelManager.h"
#import "LeaderDataObject.h"

@interface SecondViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *vt;

@property (strong,nonatomic) RequestManager* rm;
@property (strong,nonatomic) ModelManager* mm;
@property (strong,nonatomic) LeaderDataObject* ldo;
@property (strong, nonatomic) NSArray* datasource;

@end
