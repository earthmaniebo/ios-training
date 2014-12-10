//
//  EBBAddPostView.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBAddPostView.h"

@implementation EBBAddPostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)cancelButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonPressed)]) {
        [self.delegate cancelButtonPressed];
    }
}

- (IBAction)addButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addButtonPressed)]) {
        [self.delegate addButtonPressed];
    }
}
@end
