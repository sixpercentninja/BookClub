//
//  Comment+CoreDataProperties.h
//  BookClub
//
//  Created by Andrew Chen on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) Book *comment_of_book;

@end

NS_ASSUME_NONNULL_END
