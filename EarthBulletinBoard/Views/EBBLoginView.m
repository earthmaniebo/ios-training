//
//  EBBLoginView.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBLoginView.h"

@implementation EBBLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loginButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginButtonPressed)]) {
        [self.delegate loginButtonPressed];
    }
}
@end
