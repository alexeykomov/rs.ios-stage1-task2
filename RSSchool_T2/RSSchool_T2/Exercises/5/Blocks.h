#import <Foundation/Foundation.h>

typedef void (^BlockA)(NSArray *);
typedef void (^BlockB)(Class);
typedef void (^BlockC)(NSObject *result);

@interface Blocks : NSObject

{
    NSArray *_data;
}

@property (nonatomic, copy) void (^blockA)(NSArray *);
@property (nonatomic, copy) void (^blockB)(Class);
@property (nonatomic, copy) void (^blockC)(NSObject *result);

@end
