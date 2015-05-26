//
//  CoreData.h
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreData : NSObject
- (void) saveData: (NSString *) entity_Attribute Value: (NSString *) attribute For_Key: (NSString *) key;
- (NSMutableArray*) getNameData: (NSString *) entityName Key: (NSString*) key;
- (NSMutableArray*) getAgeData: (NSString *) entityAge Key: (NSString*) key;
- (NSMutableArray*) getNumberData: (NSString *) entityNumber Key: (NSString*) key;
- (NSManagedObjectContext *) managedObjectContext;
- (void) saveImageData: (NSString *) entity_Name Value: (NSData *) imageData For_Key: (NSString *) key;
- (NSData*) getImageData: (NSString *) entityName Key: (NSString*) key;

@end
