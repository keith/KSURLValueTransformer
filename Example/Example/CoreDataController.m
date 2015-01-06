#import "CoreDataController.h"

@interface CoreDataController ()

@property (nonatomic, readwrite) NSManagedObjectContext *mainContext;
@property (nonatomic) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic) NSManagedObjectModel *model;

@end

@implementation CoreDataController

- (NSManagedObjectContext *)mainContext
{
    if (!_mainContext) {
        _mainContext = [[NSManagedObjectContext alloc]
                        initWithConcurrencyType:NSMainQueueConcurrencyType];
        _mainContext.persistentStoreCoordinator = self.coordinator;
    }

    return _mainContext;
}

- (NSPersistentStoreCoordinator *)coordinator
{
    if (_coordinator) return _coordinator;

    _coordinator = [[NSPersistentStoreCoordinator alloc]
                    initWithManagedObjectModel:self.model];
    NSURL *storeURL = [NSURL URLWithString:@"Example.sqlite"
                             relativeToURL:[self applicationDocumentsDirectory]];
    if (![_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                    configuration:nil
                                              URL:storeURL
                                          options:nil
                                            error:nil])
    {
        abort();
    }

    return _coordinator;
}

- (NSManagedObjectModel *)model
{
    if (!_model) {
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    }

    return _model;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

@end
