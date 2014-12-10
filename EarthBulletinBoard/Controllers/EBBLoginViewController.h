//
//  EBBLoginViewController.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBLoginView.h"

@interface EBBLoginViewController : EBBBaseUIViewController<EBBLoginViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) EBBLoginView *loginView;

@end
