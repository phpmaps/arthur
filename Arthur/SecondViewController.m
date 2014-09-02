//
//  SecondViewController.m
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@end

@implementation SecondViewController

@synthesize datasource;

-(void)loadView
{

    

    
    

}

- (void) handleLeaders:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"LeadersNotification"]){
        NSLog (@"Received leaders notification!");
        
        if(!self.datasource){
        
            NSDictionary * dict = [notification userInfo];
        
            NSLog(@"load Registration Notification dict %@", dict);
        
            [self.mm setupLeadersFromDictionary:dict];
        
            self.datasource = [self.mm leadersArray];
        
            NSLog(@"The content of arry is%@",self.datasource);
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

- (void)viewDidLoad
{
    [super viewDidLoad];
   

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //We check against table to make sure we are displaying the right number of cells
    // for the appropriate table. This is so that things will work even if one day you
    //decide that you want to have two tables instead of one.
    if(tableView == self.vt){
        return([self.datasource count]);
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Name"];
    if(cell)
    {
        //set your configuration of your cell
    }
    //The beauty of this is that you have all your data in one object and grab WHATEVER you like
    //This way in the future you can add another field without doing much.
    
    if([self.datasource count] == 0){
        NSLog(@"no people to show");
    }
    else{
        self.ldo = [self.datasource objectAtIndex:indexPath.row];
        NSLog(@"%@", [self.ldo name]);
        cell.textLabel.text = [self.ldo name];
        // in the future you can grab whatever data you need like this
        //[currentPlace placeName], or [currentPlace placeDay];
    }
    return(cell);
}

@end
