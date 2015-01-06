#import "KSURLValueTransformer.h"

@implementation KSURLValueTransformer

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

+ (Class)transformedValueClass
{
    return [NSURL class];
}

- (NSData *)transformedValue:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]) {
        return nil;
    }

    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSURL *)reverseTransformedValue:(NSData *)data
{
    NSString *URLString = [[NSString alloc] initWithData:data
                                                encoding:NSUTF8StringEncoding];
    if (!URLString) {
        return nil;
    }

    return [NSURL URLWithString:URLString];
}

@end
