//
//  InitViewController.h
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface InitViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *registerName;

@property (strong, nonatomic) IBOutlet UITextField *registerPhone;

@property int *registerNumber;


- (IBAction)register:(id)sender;

@end
