#import "TimeConverter.h"

@implementation TimeConverter

- (instancetype)init
{
    self = [super init];
    if (self) {
        numberToWord = [[NSMutableDictionary alloc] init];
        numberToWord[@0] = @"midnight";
        numberToWord[@1] = @"one";
        numberToWord[@2] = @"two";
        numberToWord[@3] = @"three";
        numberToWord[@4] = @"four";
        numberToWord[@5] = @"five";
        numberToWord[@6] = @"six";
        numberToWord[@7] = @"seven";
        numberToWord[@8] = @"eight";
        numberToWord[@9] = @"nine";
        numberToWord[@10] = @"ten";
        numberToWord[@11] = @"eleven";
        numberToWord[@12] = @"twelve";
        numberToWord[@13] = @"thirteen";
        numberToWord[@15] = @"fifteen";
        numberToWord[@18] = @"eighteen";
        
        numberToWord[@20] = @"twenty";
        numberToWord[@30] = @"thirty";
        
        nTeenSuffix = @"teen";
        
        minuteSynonyms = [[NSMutableDictionary alloc] init];
        minuteSynonyms[@"fifteen minutes"] = @"quarter";
        minuteSynonyms[@"thirty minutes"] = @"half";
    }
    return self;
}

// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    int hourNumber = [hours intValue];
    int minutesNumber = [minutes intValue];
    
    if (![self isValid:hourNumber minutes:minutesNumber]) {
        return @"";
    }
    
    NSString *hourPart = [self getHourPart:hours minutes:minutes];
    if (minutesNumber == 0) {
        if (hourNumber == 0) {
            return hourPart;
        }
        return [hourPart stringByAppendingString:@" o' clock"];
    }
    if (minutesNumber <= 30) {
        NSString *minutePart = [self getMinutePart:minutes];
        minutePart = [self getSynonym:minutePart];
        NSLog(@"Minute part: %@", minutePart);
        NSString *res;
        res = [minutePart stringByAppendingString:@" past "];
        res = [res stringByAppendingString:hourPart];
        NSLog(@"Result: %@", res);
        return res;
    }
    if (minutesNumber > 30) {
        NSString *hourPart = [self
                              getHourPart:[@((hourNumber + 1) % 24) stringValue]
                              minutes:minutes];
        NSString *minutePart = [self getMinutePart:[@(60 - minutesNumber) stringValue]];
        minutePart = [self getSynonym:minutePart];
        NSString *res;
        res = [minutePart stringByAppendingString:@" to "];
        res = [res stringByAppendingString:hourPart];
        return res;
    }
    return @"";
}

- (NSString*)getHourPart:(NSString*)hours minutes:(NSString*)minutes {
    NSString *hour;
    int hourNumber = [hours intValue];
    int minutesNumber = [minutes intValue];
    
    if (hourNumber == 0) {
        return [numberToWord objectForKey:@(hourNumber)];
    }
    if ([numberToWord objectForKey:@(hourNumber)]) {
        return [numberToWord objectForKey:@(hourNumber)];
    }
  
    NSString *res;
    res = [[numberToWord objectForKey:@(hourNumber - 10)] stringByAppendingString:nTeenSuffix];
    return res;
}

- (NSString*)getMinutePart:(NSString*)minutes {
  
    int minutesNumber = [minutes intValue];
    if ([numberToWord objectForKey:@(minutesNumber)]) {
        NSString *res;
        res = [numberToWord objectForKey:@(minutesNumber)];
        res = [res stringByAppendingString:@" minutes"];
        return res;
    }
    if (minutesNumber < 20) {
        NSString *res;
        res = [[numberToWord objectForKey:@(minutesNumber - 10)] stringByAppendingString:nTeenSuffix];
        res = [res stringByAppendingString:@" minutes"];
        return res;
    }
    
    NSRange r = NSMakeRange(0, 1);
    NSString *firstSymbol = [minutes substringWithRange:r];
    int firstSymbolnumber = [firstSymbol intValue] * 10;
    NSString *res;
    res = [numberToWord objectForKey:@(firstSymbolnumber)];
    
    r = NSMakeRange(1, 1);
    NSString *secondSymbol = [minutes substringWithRange:r];
    int secondSymbolnumber = [secondSymbol intValue];
    res = [res stringByAppendingString:@" "];
    res = [res stringByAppendingString:[numberToWord objectForKey:@(secondSymbolnumber)]];
    res = [res stringByAppendingString:@" minutes"];
    return res;
           
}

- (NSString*)getSynonym:(NSString*)minutes {
    if ([minuteSynonyms objectForKey:minutes]) {
        return [minuteSynonyms objectForKey:minutes];
    }
    return minutes;
}

- (BOOL)isValid:(int)hours minutes:(int)minutes {
    if (hours >= 0 && hours < 24 && minutes >= 0 && minutes < 60) {
        return YES;
    }
    return NO;
}

@end
