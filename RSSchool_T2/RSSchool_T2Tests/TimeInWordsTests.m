#import <XCTest/XCTest.h>
#import "TimeConverter.h"

@interface TimeInWordsTests : XCTestCase
@property (nonatomic) TimeConverter* converter;
@end

@implementation TimeInWordsTests

- (void)setUp {
    self.converter = [[TimeConverter alloc] init];
}

- (void)tearDown {
    self.converter = nil;
}

- (void)testTimeConvertation_With0Minutes {
    XCTAssertEqualObjects([self.converter convertFromHours:@"11" minutes:@"00"], @"eleven o' clock");
}

- (void)testTimeConvertation_With5Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"9" minutes:@"05"], @"five minutes past nine");
}

- (void)testTimeConvertation_With15Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"4" minutes:@"15"], @"quarter past four");
}

- (void)testTimeConvertation_With30Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"2" minutes:@"30"], @"half past two");
}

- (void)testTimeConvertation_With40Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"5" minutes:@"38"], @"twenty two minutes to six");
}

- (void)testTimeConvertation_With45Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"5" minutes:@"45"], @"quarter to six");
}

- (void)testTimeConvertation_With58Minutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"10" minutes:@"58"], @"two minutes to eleven");
}

- (void)testTimeConvertation_InvalidMinutes {
   XCTAssertEqualObjects([self.converter convertFromHours:@"10" minutes:@"68"], @"");
}
@end
