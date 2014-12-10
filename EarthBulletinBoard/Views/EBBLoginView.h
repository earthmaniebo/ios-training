//
//  EBBLoginView.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBLoginViewDelegate <NSObject>

@required
- (void)loginButtonPressed;

@end

@interface EBBLoginView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

// IBActions
- (IBAction)loginButtonPressed:(id)sender;

@property (strong) id<EBBLoginViewDelegate> delegate;

@end
