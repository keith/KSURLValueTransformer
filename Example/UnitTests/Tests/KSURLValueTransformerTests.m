#import "KSURLValueTransformer.h"
#import "CoreDataController.h"
#import "Thing.h"

@interface KSURLValueTransformerTests : XCTestCase

@property (nonatomic) NSManagedObjectContext *context;

@end

static NSString *const GoogleURLString = @"http://google.com";

@implementation KSURLValueTransformerTests

- (void)setUp
{
    [super setUp];
    self.context = [[CoreDataController new] mainContext];
}

- (void)testReturnsURL
{
    NSString *entityName = NSStringFromClass([Thing class]);
    Thing *thing = [NSEntityDescription
                    insertNewObjectForEntityForName:entityName
                    inManagedObjectContext:self.context];
    thing.thingURL = [NSURL URLWithString:GoogleURLString];
    BOOL saved = [self.context save:nil];
    XCTAssert(saved);

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    Thing *fetchedThing = [[self.context executeFetchRequest:request
                                                       error:nil] firstObject];
    XCTAssertTrue([fetchedThing.thingURL isKindOfClass:[NSURL class]]);
    NSString *URLString = fetchedThing.thingURL.absoluteString;
    XCTAssertEqualObjects(URLString, GoogleURLString);
}

@end
