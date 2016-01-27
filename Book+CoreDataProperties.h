//
//  Book+CoreDataProperties.h
//  BookClub
//
//  Created by Andrew Chen on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *books_owner;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *books_comments;

@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addBooks_ownerObject:(NSManagedObject *)value;
- (void)removeBooks_ownerObject:(NSManagedObject *)value;
- (void)addBooks_owner:(NSSet<NSManagedObject *> *)values;
- (void)removeBooks_owner:(NSSet<NSManagedObject *> *)values;

- (void)addBooks_commentsObject:(NSManagedObject *)value;
- (void)removeBooks_commentsObject:(NSManagedObject *)value;
- (void)addBooks_comments:(NSSet<NSManagedObject *> *)values;
- (void)removeBooks_comments:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END