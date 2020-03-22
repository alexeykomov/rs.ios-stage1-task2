#import "Blocks.h"

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSArray alloc] init];
        Blocks* __weak weakSelf = self;
        self.blockA = ^void(NSArray* data) {
            _data = data;
        };
        self.blockB = ^void(Class cl) {
            NSObject *res = [[NSObject alloc] init];
            NSDate *resDate;
            NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
            if ([[NSString class] isEqual:cl]) {
               res = @"";
            }
            if ([[NSNumber class] isEqual:cl]) {
               res = @0;
            }
            if ([[NSDate class] isEqual:cl]) {
                resDate = [[NSDate alloc] initWithTimeIntervalSince1970:0];
                res = @"";
                fmt.dateFormat = @"dd.MM.YYYY";
                fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
                fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600 * 3];
            }
            
            for (int counter = 0; counter < [_data count]; counter++) {
                NSObject *entry = [_data objectAtIndex:counter];
                if ([entry isKindOfClass:cl]) {
                    if ([entry isKindOfClass:[NSString class]]) {
                        res = [(NSString*)res stringByAppendingString:(NSString*)entry];
                    }
                    if ([entry isKindOfClass:[NSNumber class]]) {
                        res = @([(NSNumber*)res intValue] + [(NSNumber*)entry intValue]);
                    }
                    if ([entry isKindOfClass:[NSDate class]]) {
                        if ([(NSDate*)entry compare:(NSDate*)resDate] > 0) {
                            res = [fmt stringFromDate:(NSDate*) entry];
                            resDate = (NSDate*) entry;
                        }
                    }
                }
            }
            
            weakSelf.blockC(res);
        };
    }
    return self;
}

@end

