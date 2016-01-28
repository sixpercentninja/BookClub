//
//  FriendsTableTableViewController.m
//  BookClub
//
//  Created by Andrew Chen on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "FriendsTableTableViewController.h"
#import "Friend.h"
#import "AppDelegate.h"

@interface FriendsTableTableViewController ()

@property NSArray *jsonDataObjects;
@property NSManagedObjectContext *moc;
@property NSMutableArray *friendsArray;

@end

@implementation FriendsTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    
    self.jsonDataObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
    
    [self loadFriends];
    
    if (self.friendsArray.count == 0) {
        for (int i =0; i<self.jsonDataObjects.count; i++) {
//            Friend *newFriend = [Friend new];
            
            Friend *newFriend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.moc];
            newFriend.name = [self.jsonDataObjects objectAtIndex:i];
            
            NSError *error;
            
            if (![self.moc save:&error]) {
                NSLog(@"Here's the error: %@", error.localizedDescription);
            }
        }
    }
    
    [self.tableView reloadData];
}

-(void) loadFriends {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Friend"];
    NSError *error;
    self.friendsArray = [[self.moc executeFetchRequest:request error:&error]mutableCopy];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendcell" forIndexPath:indexPath];
    Friend *currentFriend = [self.friendsArray objectAtIndex:indexPath.row];
    if ([currentFriend.selected  isEqual: @1]) {
        cell.backgroundColor = [UIColor yellowColor];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = [[self.friendsArray objectAtIndex:indexPath.row] name];;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend *friendToAdd = [self.friendsArray objectAtIndex:indexPath.row];
    if ([[friendToAdd selected]  isEqual: @0] || !friendToAdd.selected) {
        [self.user addUsers_friendsObject:friendToAdd];
        friendToAdd.selected = @1;
    } else {
        [self.user removeUsers_friendsObject:friendToAdd];
        friendToAdd.selected = @0;
    }
    
    NSError *error;
    
    if(![self.moc save:&error]){
        NSLog(@"Error message: %@", error.localizedDescription);
    }
    [self.tableView reloadData];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
