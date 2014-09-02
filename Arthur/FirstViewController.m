//
//  FirstViewController.m
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()



@end



@implementation FirstViewController


/*
-(void)loadView
{
    self.hasRegistered = NO;
    if(self.hasRegistered){
        [self.tabBarController setSelectedIndex:1];
    }
    
    //return;
    

     NSMutableArray *tbViewControllers = [NSMutableArray arrayWithArray:[self.tabBarController viewControllers]];
    [tbViewControllers removeObjectAtIndex:2];
    [self.tabBarController setViewControllers:tbViewControllers];
     *
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)claimPoint:(id)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleClaimPoint:)
                                                 name:@"PointNotification"
                                               object:nil];
    
    NSMutableDictionary *params = [[ NSMutableDictionary alloc] initWithCapacity:1];
    [params setObject: @"One"  forKey: @"pointValue"];
    [params setObject: @"5454447878" forKey:  @"registeredNumber"];
    [params setObject: @"Doogle" forKey:  @"registeredUser"];
    
    RequestManager* rm = [[RequestManager alloc] initWithUrlAndDataAndNotificationKey:@"http://localhost/work/dev/gt/service-uc.php" data:params notificationKey:@"PointNotification"];
    
    //RequestManager *rm = [[RequestManager alloc] in]
    
    NSString *url = [rm _url];
    NSData *data = [rm toJSON:[rm _data]];
    NSString *jsonDataAsString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(jsonDataAsString);
    NSLog(url);
    NSLog(@"fdsfsd");
    [rm doPost];
}

- (void) handleClaimPoint:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"PointNotification"]){
        NSLog (@"Gotcha..Successfully received the test notification!");
        //self._message.text = [NSString stringWithFormat: @"%d", 0];
        //self._message.text = @"+1";
        dispatch_async(dispatch_get_main_queue(), ^{
            //Code here to which needs to update the UI in the UI thread goes here
            self.pointLabel.text = @"+1";
            [UIView animateWithDuration:1.0
                                  delay:3.0  /* starts the animation after 3 seconds */
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^ {
                                 self.pointLabel.alpha = 0.0;
                             }
                             completion:^(BOOL finished) {
                                 self.pointLabel.alpha = 1.0;
                                 self.pointLabel.text = @"";
                             }];
            
        });
        
        
        //[_message setText:[NSString stringWithFormat:@"%d",10]];
        
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


@end
