#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    int counterA = 0;
    int counterB = 0;
    while ((counterA < [a length]) && (counterB < [b length])) {
        NSRange rB = NSMakeRange(counterB, 1);
        NSRange rA = NSMakeRange(counterA, 1);
        NSString *symbolB = [b substringWithRange:rB];
        NSString *symbolA = [a substringWithRange:rA];
        if ([symbolB isEqualToString:symbolA]) {
            counterB++;
            counterA++;
            continue;
        }
        if (![symbolB isEqualToString:symbolA]) {
            if ([symbolB isEqualToString:[symbolA uppercaseString]]) {
                counterB++;
                counterA++;
                continue;
            }
            counterA++;
        }
    }
    
    return counterB == [b length] ? @"YES" : @"NO";
    
}
@end
