#import <Foundation/Foundation.h>

@interface RequestManager : NSObject <NSURLConnectionDelegate>
{
    NSString *databasePath;
}

@property NSDictionary* _data;
@property NSString* _url;
@property NSMutableData* _response;
@property NSString* _notificationKey;

-(id)initWithUrlAndDataAndNotificationKey:(NSString*)url data:(NSDictionary*)data notificationKey:(NSString*)notificationKey;
-(NSData*)toJSON:(NSDictionary*)dictionary;
-(void)doPost;



@end

