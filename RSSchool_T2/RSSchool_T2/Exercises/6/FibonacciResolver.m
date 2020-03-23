#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int product = 0;
    int index = 0;
    int productToCompareTo = [(NSNumber*) number intValue];
    while (true) {
        int nth = [self getFibonacciNumberForN:index];
        int nPlus1th = [self getFibonacciNumberForN:index + 1];
        
        product = nth * nPlus1th;
        NSLog(@"Fibonacci number: %d", nth);
        NSLog(@"Product: %d", product);
        if (product == productToCompareTo) {
            return @[@(nth), @(nPlus1th), @1];
        };
        if (product > productToCompareTo) {
            return @[@(nth), @(nPlus1th), @0];
        };
        
        index++;
    }
    return @[];
}

- (int)getFibonacciNumberForN:(int)n {
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    int prevPrevNumber = 0;
    int prevNumber = 1;
    int current;
    int counter = 1;
    while (counter < n) {
        current = prevPrevNumber + prevNumber;
        prevPrevNumber = prevNumber;
        prevNumber = current;
        
        counter++;
    }
    return current;
}

@end
