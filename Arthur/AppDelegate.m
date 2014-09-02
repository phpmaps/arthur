//
//  AppDelegate.m
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    self.rootViewController = (SecondViewController *)navController.viewControllers[0];
    [self getLeaders];
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

-(void) getLeaders
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleLeaders:)
                                                 name:@"LeadersNotification"
                                               object:nil];
    
    NSMutableDictionary *params = [[ NSMutableDictionary alloc] initWithCapacity:1];
    [params setObject: @"One"  forKey: @"pointValue"];
    [params setObject: @"5454447878" forKey:  @"registeredNumber"];
    [params setObject: @"Doogle" forKey:  @"registeredUser"];
    
    self.rm = [[RequestManager alloc] initWithUrlAndDataAndNotificationKey:@"http://localhost/work/dev/gt/leaders.php" data:params notificationKey:@"LeadersNotification"];
    
    [self.rm doPost];

}

- (void) handleLeaders:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"LeadersNotification"]){
        NSLog (@"Received leaders notification!");
        
        if(!self.rootViewController.datasource){
            
            NSDictionary * dict = [notification userInfo];
            
            NSLog(@"load Registration Notification dict %@", dict);
            
            [self.mm setupLeadersFromDictionary:dict];
            
            self.rootViewController.datasource = [self.mm leadersArray];
        }
        
        //NSLog(@"count is:  %@", [[self.mm leadersArray] count]);
        
        
        //self.datasource = [self.mm leadersArray];
        
        
        
        
        //[self.mm setupLeadersFromJSONArray:[self.rm _response]];
        //[self.datasource];
        
        //[self setupPlacesFromJSONArray:data];
        
        //[_message setText:[NSString stringWithFormat:@"%d",10]];
        
    }
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


@end
