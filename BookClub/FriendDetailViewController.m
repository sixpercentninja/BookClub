//
//  FriendDetailViewController.m
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "Book.h"
#import "AppDelegate.h"
#import "CommentViewController.h"

@interface FriendDetailViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *addBookTextField;
@property NSMutableArray *booksArray;
@property NSManagedObjectContext *moc;

@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    [self loadBooksArray];
    self.friendNameLabel.text = self.currentFriend.name;
    
}


-(void) loadBooksArray {
    self.booksArray = [NSMutableArray arrayWithArray:[self.currentFriend.friends_books allObjects]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookcell"];
    
    cell.textLabel.text = [[self.booksArray objectAtIndex:indexPath.row] title];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.currentFriend.friends_books.count;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    Book *bookToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.moc];
    bookToAdd.title = self.addBookTextField.text;
    [self.currentFriend addFriends_booksObject:bookToAdd];
    
    NSError *error;
    
    if (![self.moc save:&error]) {
        NSLog(@"error: %@", error.localizedDescription);
    }
    [self loadBooksArray];
    [self.tableView reloadData];
    
    return [textField resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CommentViewController *destination = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForCell:sender];
    destination.currentBook = [self.booksArray objectAtIndex:path.row];
}


@end
