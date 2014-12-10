//
//  EBBHomeView.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBHomeViewDelegate <NSObject>

@required
- (void)logoutButtonPressed;
- (void)addPostButtonPressed;

@end

@interface EBBHomeView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *dpImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UIButton *addPostButton;
@property (weak, nonatomic) IBOutlet UITableView *postTableView;

// IBAction
- (IBAction)logoutButtonPressed:(id)sender;
- (IBAction)addPostButtonPressed:(id)sender;

@property (strong) id<EBBHomeViewDelegate> delegate;

@end
