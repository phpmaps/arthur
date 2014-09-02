//
//  RequestManager.m
//  Arthur
//
//  Created by Doug Carroll on 8/31/14.
//  Copyright (c) 2014 Doug Carroll. All rights reserved.
//

#import "RequestManager.h"


@implementation RequestManager

@synthesize _url;
@synthesize _data;
@synthesize _response;
@synthesize _notificationKey;


- (id)initWithUrlAndDataAndNotificationKey:(NSString *)url
                                      data:(NSDictionary*)data
                           notificationKey:(NSString *)notificationKey {
    self = [super init];
    if (self) {
        self._url = [url copy];
        self._data = [data copy];
        self._notificationKey = [notificationKey copy];
    }
    return self;
}

- (id)init {
    // Forward to the "designated" initialization method
    return [self initWithUrlAndDataAndNotificationKey:nil data:nil notificationKey:nil];
}


-(NSData *)toJSON:(NSDictionary *)dictionary
{
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonDataAsString = [[NSString alloc] initWithData:jsonData encoding:NSASCIIStringEncoding];
    NSLog(jsonDataAsString);
    return jsonData;
}

-(void)doPost
{
    //NSURLRequest *request = [NSURLRequest alloc];

    //[request setHTTPMethod:@"POST"];
    //[request setValue:@"application/json; charset=utf-8" f forHTTPHeaderField:@"Content-Type"];
    //[request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *jsonDataAsString = [[NSString alloc] initWithData:[self toJSON:self._data] encoding:NSASCIIStringEncoding];
    
    NSString *post =[NSString stringWithFormat:@"claimPoint(%@)",jsonDataAsString];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:self._url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if([data length] > 0 && error == nil){
            
            self._response = [[NSMutableData alloc] initWithData:data];
            
            NSString* theString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            //NSLog(theString);
            
            //self.JSONResponseString = [[NSString alloc] initWithData:self.JSONResponseData encoding:NSUTF8StringEncoding];
            
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData: [theString  dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error:nil];
            
            
            
            [[NSNotificationCenter defaultCenter]
             postNotificationName:self._notificationKey
             object:self userInfo:dataDictionary];
            
            
            
        }else if ([data length] == 0 && error == nil){
            NSLog(@"Response empty.");
        }else if (error != nil && error.code == NSURLErrorTimedOut){
            NSLog(@"Request timed out.");
        }else if (error != nil){
            NSLog(@"Error = %@", error);
        }
        
    }];
    
    
    

    //NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *str=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    self._response = [[NSMutableData alloc] init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [self._response appendData:data];
    NSMutableData *m = data;
    NSLog(@"fghfghfg");
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

@end
