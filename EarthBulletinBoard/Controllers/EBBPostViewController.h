//
//  EBBPostViewController.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBPostView.h"

@interface EBBPostViewController : EBBBaseUIViewController<EBBPostViewDelegate>

@property (strong, nonatomic) EBBPostView *postView;

@end
