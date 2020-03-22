#import "NSString+Transform.h"

@implementation NSString (Transform)

NSString *alphabet = @"a b c d e f g h i j k l m n o p q r s t u v w x y z";
NSString *vowels = @"a e i o u y";
NSString *consonants = @"b c d f g h j k l m n p q r s t v w x z";
int alphabetLength = 25;

BOOL isPangram(NSString *input) {
    NSMutableSet *alphabetSet = [[NSMutableSet alloc] initWithArray:
    [alphabet componentsSeparatedByString:@" "]];
    
    NSMutableSet *found = [[NSMutableSet alloc] init];
    for (int counter = 0; counter < [input length]; counter++) {
        NSRange r = NSMakeRange(counter, 1);
        NSString *symbol = [input substringWithRange:r];
        [found addObject:[symbol lowercaseString]];
    }
    return [alphabetSet isSubsetOfSet:found];
}

int countChars(NSString *input, NSMutableSet *vowelsSet) {
    int res = 0;
    for (int counter = 0; counter < [input length]; counter++) {
        NSRange r = NSMakeRange(counter, 1);
        NSString *symbol = [input substringWithRange:r];
        if ([vowelsSet containsObject:[symbol lowercaseString]]) {
            res++;
        };
    }
    return res;
}


NSInteger sortByCount(NSDictionary* posA, NSDictionary* posB, void *context) {
    int v1 = [(NSNumber*) posA[@"count"] intValue];
    int v2 = [(NSNumber*) posB[@"count"] intValue];
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

NSString* capitalizeChars(NSString *input, NSMutableSet *charSet) {
    NSMutableString *res = [[NSMutableString alloc] initWithString:input];
    for (int counter = 0; counter < [res length]; counter++) {
        NSRange r = NSMakeRange(counter, 1);
        NSString *symbol = [input substringWithRange:r];
        if ([charSet containsObject:symbol]) {
            [res replaceCharactersInRange:r withString:[symbol capitalizedString]];
        };
    }
    return res;
}

-(NSString*)transform {
    NSLog(@"Input: %@", self);
    
    NSMutableArray<NSDictionary *> *pairs = [[NSMutableArray alloc] init];
    NSString *trimmed = [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    trimmed = [trimmed
                stringByReplacingOccurrencesOfString:@"[\\s]+"
                withString:@" "
                options:NSRegularExpressionSearch
                range:NSMakeRange(0, [trimmed length])];
    NSMutableArray<NSMutableString *> *words = [trimmed componentsSeparatedByString:@" "];
    NSMutableSet *charSet = isPangram(self) ?
    [[NSMutableSet alloc] initWithArray:[vowels componentsSeparatedByString:@" "]] :
    [[NSMutableSet alloc] initWithArray:
    [consonants componentsSeparatedByString:@" "]];
    
    if ([trimmed length] == 0) {
        return @"";
    }
    
    for (int counter = 0; counter < [words count]; counter++) {
        NSString *word = [words objectAtIndex:counter];
        [pairs addObject:@{
            @"count": @(countChars(word, charSet)),
            @"word": word
        }];
    }
    pairs = [pairs sortedArrayUsingFunction:sortByCount context:NULL];
    [words removeAllObjects];
    for (int counter = 0; counter < [pairs count]; counter++) {
        NSDictionary *pair = [pairs objectAtIndex:counter];

        NSString *res = [[pair objectForKey:@"count"] stringValue];
        res = [res stringByAppendingString:capitalizeChars([pair objectForKey:@"word"], charSet)];
        
        [words addObject:res];
    }
    NSString *res = [words componentsJoinedByString:@" "];
    return res;
    
}

@end
