//
//  EBBHomeView.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBHomeView.h"

@implementation EBBHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) awakeFromNib {
    self.dpImageView.layer.cornerRadius = 40;
    self.dpImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.dpImageView.layer.borderWidth = 1.0f;
    self.dpImageView.clipsToBounds = YES;
}

- (IBAction)logoutButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(logoutButtonPressed)]) {
        [self.delegate logoutButtonPressed];
    }
}

- (IBAction)addPostButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addPostButtonPressed)]) {
        [self.delegate addPostButtonPressed];
    }
}
@end
