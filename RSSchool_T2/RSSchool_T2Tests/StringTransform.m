#import <XCTest/XCTest.h>
#import "NSString+Transform.h"

@interface StringTransformTests : XCTestCase

@end

@implementation StringTransformTests

- (void)test0 {
    NSString *testString = @"Sphinx of black quartz, judge my vow.";
    NSString *resultString = @"1SphInx 1Of 1blAck 1mY 1vOw. 2qUArtz, 2jUdgE";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test1 {
    NSString *testString = @"Pack my box with five dozen liquor jugs. - Mark Dunn";
    NSString *resultString = @"0- 1PAck 1mY 1bOx 1wIth 1jUgs. 1MArk 1DUnn 2fIvE 2dOzEn 3lIqUOr";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test2 {
    NSString *testString = @"Sympathizing would fix Quaker objectives. Sympathizing would fix Quaker objectives. Sympathizing would fix Quaker objectives.";
    NSString *resultString = @"1fIx 1fIx 1fIx 2wOUld 2wOUld 2wOUld 3QUAkEr 3QUAkEr 3QUAkEr 4SYmpAthIzIng 4ObjEctIvEs. 4SYmpAthIzIng 4ObjEctIvEs. 4SYmpAthIzIng 4ObjEctIvEs.";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test3 {
    NSString *testString = @"By Jove, my quick study of lexicography won a prize!";
    NSString *resultString = @"1BY 1mY 1Of 1wOn 1A 2JOvE, 2qUIck 2stUdY 2prIzE! 5lExIcOgrAphY";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test4 {
    NSString *testString = @"Hello! I'm Jhon Doe!!!";
    NSString *resultString = @"1I'M 1Doe!!! 3HeLLo! 3JHoN";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test5 {
    NSString *testString = @"      By Jove, my quick st☁☁udy of ☁lexicography won a prize! @ ☁☁☁";
    NSString *resultString = @"0 0 0 0 0 0@ 0☁☁☁ 1BY 1mY 1Of 1wOn 1A 2JOvE, 2qUIck 2st☁☁UdY 2prIzE! 5☁lExIcOgrAphY";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test6 {
    NSString *testString = @"           ";
    NSString *resultString = @"0 0 0 0 0 0 0 0 0 0 0";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test7 {
    NSString *testString = @"TWO driven jock helps fax my big quiz.";
    NSString *resultString = @"1TWO 1jOck 1hElps 1fAx 1mY 1bIg 2drIvEn 2qUIz.";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test8 {
    NSString *testString = @"TWO driven jock helped fax my big quiz.";
    NSString *resultString = @"1My 2TWO 2FaX 2BiG 2QuiZ. 3JoCK 4DRiVeN 4HeLPeD";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test9 {
    NSString *testString = @"                     ";
    NSString *resultString = @"";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

- (void)test10 {
    NSString *testString = @"asdasdasdasda \
                            sdasdadasd sadasdasdas \
                            sadadad  ";
    NSString *resultString = @"4SaDaDaD 7SDaSDaDaSD 7SaDaSDaSDaS 8aSDaSDaSDaSDa";
    BOOL f = [resultString isEqualToString:[testString transform]];
    XCTAssertTrue(f);
}

@end
