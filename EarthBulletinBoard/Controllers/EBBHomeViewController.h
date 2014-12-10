//
//  EBBHomeViewController.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBHomeView.h"
#import "EBBPostTableViewCell.h"

@interface EBBHomeViewController : EBBBaseUIViewController<EBBHomeViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) EBBHomeView *homeView;

@end
