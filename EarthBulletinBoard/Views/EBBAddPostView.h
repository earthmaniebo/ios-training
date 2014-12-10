//
//  EBBAddPostView.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBAddPostViewDelegate <NSObject>

@required

- (void)cancelButtonPressed;
- (void)addButtonPressed;

@end

@interface EBBAddPostView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

// IBActions
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@property (strong) id<EBBAddPostViewDelegate> delegate;

@end
