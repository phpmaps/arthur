//
//  AppDelegate.h
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"
#import "RequestManager.h"
#import "SecondViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) RequestManager* rm;
@property (strong,nonatomic) ModelManager* mm;
@property (strong,nonatomic) SecondViewController *rootViewController;

@end
