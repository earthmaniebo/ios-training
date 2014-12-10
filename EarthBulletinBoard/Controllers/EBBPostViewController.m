//
//  EBBPostViewController.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/10/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBPostViewController.h"

@interface EBBPostViewController ()

@end

@implementation EBBPostViewController

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
    // Load xib file
    self.postView = (EBBPostView*)[self getCustomXibUsingXibName:@"PostView"];
    self.postView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    // Set delegates
    self.postView.delegate = self;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *currentTitle = [defaults objectForKey:@"currTitle"];
//    NSString *currentPost = [defaults objectForKey:@"currPost"];
    NSString *currentUser = [defaults objectForKey:@"currUser"];
    
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tempus, magna et fringilla interdum, urna velit maximus leo, vitae porta velit dolor a lacus. Nam eget sagittis nisi. Integer vehicula tellus quis risus malesuada varius. Aliquam et accumsan eros. Vestibulum aliquam lobortis nulla in efficitur. Donec quis velit nunc. Proin in consectetur diam. Nam finibus nulla malesuada urna accumsan imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean egestas interdum nisl et placerat. Duis sed odio dui. Aenean varius pretium bibendum. Proin feugiat sed lacus eget ultricies.Vestibulum sit amet nunc ac mi sollicitudin consequat at eu odio. Mauris ut congue dolor. Vestibulum eget sem dapibus, sagittis sem et, feugiat lectus. Mauris molestie quam vel aliquet pulvinar. Maecenas sapien velit, pretium vitae nulla ac, sodales aliquam mauris. Integer sed semper ligula, ac volutpat justo. Cras suscipit nec quam quis pretium. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eleifend lacus est, id sollicitudin lorem congue et. Suspendisse potenti. Maecenas hendrerit sem tincidunt laoreet euismod. Morbi consequat et nulla quis pretium. Aenean finibus mauris ac lorem porta, commodo iaculis leo porttitor. Proin leo urna, aliquam facilisis justo sit amet, ullamcorper imperdiet justo. Duis ipsum urna, vehicula nec tortor quis, semper blandit turpis. Vivamus nec posuere purus. Donec aliquam neque ac neque suscipit, vel placerat nunc molestie. Proin fermentum nibh sed felis iaculis, et tempus nulla luctus. Donec nisi leo, facilisis sed tempus ac, vehicula nec nibh. Sed venenatis mollis elementum. Integer non metus id ligula aliquet tempor. Vivamus metus mauris, sodales quis nisi sed, tristique molestie lectus.";
    
    self.postView.titleLabel.text = currentTitle;
    self.postView.bodyLabel.text = text;
    [self.postView.bodyLabel sizeToFit];
    self.postView.postedByLabel.text = currentUser;

    CGSize labelSize = [text sizeWithFont:[UIFont systemFontOfSize:17.0f]
                        constrainedToSize:self.postView.bodyLabel.frame.size
                            lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat labelHeight = labelSize.height;
    
    self.postView.scrollView.contentSize = CGSizeMake(self.postView.bodyLabel.frame.size.width, labelHeight + 5.0);
    
    self.navigationItem.title = @"Post";
    
    [self.view addSubview:self.postView];
}

#pragma mark - EBBPostView Delegates
- (void)seeCommentButtonPressed {
    [self performSegueWithIdentifier:@"PostToCommentSegue" sender:self];
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
