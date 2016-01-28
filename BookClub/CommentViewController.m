//
//  CommentViewController.m
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import "CommentViewController.h"
#import "AppDelegate.h"
#import "Comment.h"

@interface CommentViewController () <UITableViewDataSource, UITabBarDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *addCommentTextField;
@property NSMutableArray *commentsArray;
@property NSManagedObjectContext *moc;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bookNameLabel.text = self.currentBook.title;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    [self loadComments];
}


-(void) loadComments {
    self.commentsArray = [NSMutableArray arrayWithArray: [self.currentBook.books_comments allObjects]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell"];
    cell.textLabel.text = [[self.commentsArray objectAtIndex:indexPath.row] comment];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.currentBook.books_comments.count;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    Comment *commentToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.moc];
    
    commentToAdd.comment = self.addCommentTextField.text;
    [self.currentBook addBooks_commentsObject:commentToAdd];
    
    NSError *error;
    
    if (![self.moc save:&error]) {
        NSLog(@"error: %@", error.localizedDescription);
    }
    
    [self loadComments];
    [self.tableView reloadData];
    
    return [textField resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
