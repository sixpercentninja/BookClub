//
//  Friend+CoreDataProperties.m
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Friend+CoreDataProperties.h"

@implementation Friend (CoreDataProperties)

@dynamic name;
@dynamic selected;
@dynamic friends_books;
@dynamic friends_user;

@end
