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

- (NSData *)transformedValue:(id)value
{
    NSString *string = nil;
    if ([value isKindOfClass:[NSURL class]]) {
        string = [value absoluteString];
    } else if ([value isKindOfClass:[NSString class]]) {
        string = value;
    } else {
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
