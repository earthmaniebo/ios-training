//
//  EBBAddPostViewController.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBAddPostViewController.h"

@interface EBBAddPostViewController ()

@end

@implementation EBBAddPostViewController

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
    self.addPostView = (EBBAddPostView*)[self getCustomXibUsingXibName:@"AddPostView"];
    self.addPostView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.addPostView.delegate = self;
    
    [self.view addSubview:self.addPostView];
}

#pragma mark - EBBAddPostView Delegates
- (void)cancelButtonPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addButtonPressed {
    
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
