//
//  Book+CoreDataProperties.h
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"
@class Friend;
@class Comment;

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<Comment *> *books_comments;
@property (nullable, nonatomic, retain) NSSet<Friend *> *books_owner;

@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addBooks_commentsObject:(Comment *)value;
- (void)removeBooks_commentsObject:(Comment *)value;
- (void)addBooks_comments:(NSSet<Comment *> *)values;
- (void)removeBooks_comments:(NSSet<Comment *> *)values;

- (void)addBooks_ownerObject:(Friend *)value;
- (void)removeBooks_ownerObject:(Friend *)value;
- (void)addBooks_owner:(NSSet<Friend *> *)values;
- (void)removeBooks_owner:(NSSet<Friend *> *)values;

@end

NS_ASSUME_NONNULL_END
