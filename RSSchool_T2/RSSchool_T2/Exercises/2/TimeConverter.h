#import <Foundation/Foundation.h>

@interface TimeConverter : NSObject

{
    NSMutableDictionary *numberToWord;
    NSMutableDictionary *minuteSynonyms;
    NSString *nTeenSuffix ;
}

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes;
@end
