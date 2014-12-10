//
//  EBBPostView.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBPostViewDelegate <NSObject>

@required
- (void)seeCommentButtonPressed;

@end

@interface EBBPostView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postedByLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIButton *seeCommentButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


// IBActions
- (IBAction)seeCommentButtonPressed:(id)sender;


@property (strong) id<EBBPostViewDelegate> delegate;

@end
