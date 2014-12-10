//
//  EBBCommentViewController.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBCommentViewController.h"

@interface EBBCommentViewController ()

@end

@implementation EBBCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeContents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)initializeContents {
    // Load xib
    self.commentView = (EBBCommentView*)[self getCustomXibUsingXibName:@"CommentView"];
    self.commentView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.navigationItem.title = @"Comments";
    
    self.commentView.delegate = self;
    
    [self.view addSubview:self.commentView];
}

#pragma mark - EBBCommentView Delegates
- (void)commentButtonPressed {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
