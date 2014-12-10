//
//  EBBPostTableViewCell.h
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBBPostTableViewCell : UITableViewCell

// IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;
@property (weak, nonatomic) IBOutlet UILabel *byUserLabel;

@end
