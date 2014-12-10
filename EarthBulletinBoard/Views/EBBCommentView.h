//
//  EBBCommentView.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBCommentViewDelegate <NSObject>

@required
- (void)commentButtonPressed;
@end

@interface EBBCommentView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

// IBActions
- (IBAction)commentButtonPressed:(id)sender;

@property (strong) id<EBBCommentViewDelegate> delegate;

@end
