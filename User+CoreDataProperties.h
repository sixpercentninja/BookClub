//
//  User+CoreDataProperties.h
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<Friend *> *users_friends;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addUsers_friendsObject:(Friend *)value;
- (void)removeUsers_friendsObject:(Friend *)value;
- (void)addUsers_friends:(NSSet<Friend *> *)values;
- (void)removeUsers_friends:(NSSet<Friend *> *)values;

@end

NS_ASSUME_NONNULL_END
