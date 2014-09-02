//
//  FirstViewController.h
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"

@interface FirstViewController : UIViewController<UITextFieldDelegate>


- (IBAction)claimPoint:(id)sender;
-(void)handleClaimPoint;

@property (strong, nonatomic) IBOutlet UILabel *pointLabel;

@end




