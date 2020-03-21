#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"dd MMMM, EEEE";
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU_POSIX"];
    fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600 * 3];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.day = [day intValue];
    comps.month = [month intValue];
    comps.year = [year intValue];
    NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [cal dateFromComponents:comps];
    
    NSDateComponents *appliedComps = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    
    if (appliedComps.day != [day intValue] || appliedComps.month != [month intValue] ||
        appliedComps.year != [year intValue]) {
        return @"Такого дня не существует";
    }
    
    NSLog(@"Date: %@", date);
    
    NSString *output = [fmt stringFromDate:date];
    NSLog(@"Output: %@", output);
    return output;
}

@end
