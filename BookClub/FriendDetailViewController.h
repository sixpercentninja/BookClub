//
//  FriendDetailViewController.h
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface FriendDetailViewController : UIViewController

@property Friend *currentFriend;
@property (weak, nonatomic) IBOutlet UILabel *friendNameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
