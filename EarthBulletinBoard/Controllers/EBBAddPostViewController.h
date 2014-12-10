//
//  EBBAddPostViewController.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBAddPostView.h"

@interface EBBAddPostViewController : EBBBaseUIViewController<EBBAddPostViewDelegate>

@property (strong, nonatomic) EBBAddPostView *addPostView;

@end
