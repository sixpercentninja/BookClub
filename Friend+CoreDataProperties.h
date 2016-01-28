//
//  Friend+CoreDataProperties.h
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Friend.h"
@class User;
@class Book;

NS_ASSUME_NONNULL_BEGIN

@interface Friend (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *selected;
@property (nullable, nonatomic, retain) NSSet<Book *> *friends_books;
@property (nullable, nonatomic, retain) User *friends_user;

@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addFriends_booksObject:(Book *)value;
- (void)removeFriends_booksObject:(Book *)value;
- (void)addFriends_books:(NSSet<Book *> *)values;
- (void)removeFriends_books:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
