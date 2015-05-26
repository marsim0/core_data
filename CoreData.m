//
//  CoreData.m
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "CoreData.h"



@implementation CoreData

- (NSManagedObjectContext *) managedObjectContext {
    
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
       
    }
    return context;
}

//сохранение текстовых данных
- (void) saveData: (NSString *) entity_Attribute Value: (NSString *) attribute For_Key: (NSString *) key {
    NSManagedObject * newAttribute = [NSEntityDescription insertNewObjectForEntityForName:entity_Attribute inManagedObjectContext:[self managedObjectContext]];
    [newAttribute setValue:attribute forKey:key];
    
    NSError * error = nil;
    
    if (![[self managedObjectContext] save:&error]) {
        
    }
    
}
//сохранение картинки
- (void) saveImageData: (NSString *) entity_Name Value: (NSData *) imageData For_Key: (NSString *) key {
    NSManagedObject * newName = [NSEntityDescription insertNewObjectForEntityForName:entity_Name inManagedObjectContext:[self managedObjectContext]];
    [newName setValue:imageData forKey:key];
    
    NSError * error = nil;
    
    if (![[self managedObjectContext] save:&error]) {
        
    }
    
}

//извлечение имени
- (NSMutableArray*) getNameData: (NSString *) entityName Key: (NSString*) key {

    NSMutableArray * array = [[NSMutableArray alloc]init];
        
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        NSString * value = [obj valueForKey:key];
        [array addObject:value];
    }
    
    return array;
}

//извлечение возраста
- (NSMutableArray*) getAgeData: (NSString *) entityAge Key: (NSString*) key {
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityAge inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        NSString * value = [obj valueForKey:key];
        [array addObject:value];
    }
    
    return array;
}

//извлечение номера
- (NSMutableArray*) getNumberData: (NSString *) entityNumber Key: (NSString*) key {
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityNumber inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        NSString * value = [obj valueForKey:key];
        [array addObject:value];
    }
    
    return array;
}

//извлечение картинки
- (NSData*) getImageData: (NSString *) entityName Key: (NSString*) key {
    
    NSData * imageData = [[NSData alloc]init];
    
    NSFetchRequest * requestData = [[NSFetchRequest alloc]init];
    NSEntityDescription * entityData = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    
    [requestData setEntity:entityData];
    
    NSError * error = nil;
    
    NSArray * arrayData = [[self managedObjectContext] executeFetchRequest:requestData error:&error];
    
    for (NSManagedObject * obj in arrayData) {
        imageData = [obj valueForKey:key];
        
    }
    
    return imageData;
}



@end
