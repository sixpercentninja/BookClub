//
//  CommentViewController.h
//  BookClub
//
//  Created by Rafael Auriemo on 1/27/16.
//  Copyright © 2016 Andrew Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface CommentViewController : UIViewController

@property Book *currentBook;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;

@end
