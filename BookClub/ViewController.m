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
#import "FriendDetailViewController.h"
#import "AppDelegate.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSManagedObjectContext *moc;
@property User *currentUser;
@property NSMutableArray *usersFriendsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usersFriendsArray = [NSMutableArray new];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
 
    [self loadUser];
    
    if (!self.currentUser) {
        self.currentUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.moc];
    }
    
    [self loadFriends];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self loadFriends];
    [self.tableView reloadData];
}

-(void) loadUser {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    NSError *error;
    if ([[[self.moc executeFetchRequest:request error:&error] mutableCopy] count] == 0) {
        self.currentUser = nil;
    }else {
        self.currentUser = [[[self.moc executeFetchRequest:request error:&error]mutableCopy] objectAtIndex:0];
    }
}

#pragma mark - table view delegate methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userfriendcell"];
    cell.textLabel.text = [[self.usersFriendsArray objectAtIndex:indexPath.row] name];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.currentUser.users_friends.count;
}

-(void) loadFriends {
    self.usersFriendsArray = [NSMutableArray arrayWithArray:[self.currentUser.users_friends allObjects]];
}
                        

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[FriendsTableTableViewController class]]) {
        FriendsTableTableViewController *destination = segue.destinationViewController;
        destination.user = self.currentUser;
    }else{
        FriendDetailViewController *destination = segue.destinationViewController;
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        destination.currentFriend = [self.usersFriendsArray objectAtIndex:path.row];
        destination.title = destination.currentFriend.name;
    }
    
}
@end
