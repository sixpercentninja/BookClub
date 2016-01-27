//
//  ViewController.m
//  BookClub
//
//  Created by Andrew Chen on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "FriendsTableTableViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property NSManagedObjectContext *moc;
@property User *currentUser;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
 
    [self loadUser];
    
    if (!self.currentUser) {
        self.currentUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.moc];
    }
    
}

-(void) loadUser {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    NSError *error;
    self.currentUser = [[[self.moc executeFetchRequest:request error:&error]mutableCopy] objectAtIndex:0];
}

                        

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[FriendsTableTableViewController class]]) {
        FriendsTableTableViewController *destination = segue.destinationViewController;
        destination.user = self.currentUser;
    }
    
}
@end
