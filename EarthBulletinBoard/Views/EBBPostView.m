//
//  EBBPostView.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBPostView.h"

@implementation EBBPostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)seeCommentButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(seeCommentButtonPressed)]) {
        [self.delegate seeCommentButtonPressed];
    }
}
@end
