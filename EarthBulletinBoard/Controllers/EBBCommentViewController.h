//
//  EBBCommentViewController.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBCommentView.h"

@interface EBBCommentViewController : EBBBaseUIViewController<EBBCommentViewDelegate>

@property (strong, nonatomic) EBBCommentView *commentView;

@end
