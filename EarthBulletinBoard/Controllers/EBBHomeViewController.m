//
//  EBBHomeViewController.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBHomeViewController.h"

@interface EBBHomeViewController () {
    NSMutableArray *titles;
    NSMutableArray *posts;
    NSMutableArray *users;
}

@end

@implementation EBBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"isFirstRun"] == nil) {
        NSLog(@"first run");
        
        [defaults setObject:@"YES" forKey:@"isFirstRun"];
        
        // Init arrays
        titles = [[NSMutableArray alloc] initWithObjects:@"Employees WFH due to #RubyPH", @"Codesignate Christmas Party", nil];
        posts = [[NSMutableArray alloc] initWithObjects:@"blah blah blah", @"bleh bleh bleh", nil];
        users = [[NSMutableArray alloc] initWithObjects:@"Klayre", @"Ayie", nil];
        
        // Store arrays to NSUserDefaults
        [defaults setObject:titles forKey:@"titles"];
        [defaults setObject:posts forKey:@"posts"];
        [defaults setObject:users forKey:@"users"];
        [defaults synchronize];
    }
    [self initializeContents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)initializeContents {
    // Load xib file
    self.homeView = (EBBHomeView*)[self getCustomXibUsingXibName:@"HomeView"];
    self.homeView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);

    // Hide back button
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.title = @"Home";
    
    // Set delegates
    self.homeView.delegate = self;
    self.homeView.postTableView.delegate = self;
    self.homeView.postTableView.dataSource = self;
    
    // Init nsuserdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    
    // Set values of UIView elements
    self.homeView.usernameLabel.text = [username uppercaseString];
    if ([username isEqualToString:@"earth"])
        self.homeView.dpImageView.image = [UIImage imageNamed:@"earth"];
    else
        self.homeView.dpImageView.image = [UIImage imageNamed:@"vaughn"];
    
    [self.view addSubview:self.homeView];
}

#pragma mark - EBBHomeViewDelegate Methods
- (void)logoutButtonPressed {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"username"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addPostButtonPressed {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *username = [defaults objectForKey:@"username"];
//
//    // Retrieve titles, posts, users from userdefaults
//    NSMutableArray *mutableCopyTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
//    NSMutableArray *mutableCopyPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
//    NSMutableArray *mutableCopyUsers = [[defaults arrayForKey:@"users"] mutableCopy];
//    
//    [mutableCopyTitles addObject:@"test title"];
//    [mutableCopyPosts addObject:@"test description"];
//    [mutableCopyUsers addObject:username];
//
//    // Replace old instances
//    [defaults setObject:mutableCopyTitles forKey:@"titles"];
//    [defaults setObject:mutableCopyPosts forKey:@"posts"];
//    [defaults setObject:mutableCopyUsers forKey:@"users"];
//    
//    [self.homeView.postTableView reloadData];
    [self performSegueWithIdentifier:@"HomeToAddPostSegue" sender:self];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
    return persistentTitles.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Check which tableView is currently using this delegate method
    if (tableView == self.homeView.postTableView) {
        
        // Instatiate custom tableviewcell
        EBBPostTableViewCell *postCell = (EBBPostTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PostCell"];
        
        if (postCell == nil) {
            // Load xib
            postCell = [[[NSBundle mainBundle] loadNibNamed:@"PostTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        
        // Init userdefaults;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // Retrieve users, posts, titles from userdefaults
        NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
        NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
        NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"] mutableCopy];
        
        // Assign values to labels;
        postCell.titleLabel.text = [persistentTitles objectAtIndex:indexPath.row];
        postCell.postLabel.text = [persistentPosts objectAtIndex:indexPath.row];
        postCell.byUserLabel.text = [persistentUsers objectAtIndex:indexPath.row];
        return postCell;
    }
    return nil;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Init user
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Retrieve users, posts, titles from userdefaults
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
    NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
    NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"] mutableCopy];

    NSString *currentTitle = [persistentTitles objectAtIndex:indexPath.row];
    NSString *currentPost = [persistentPosts objectAtIndex:indexPath.row];
    NSString *currentUser = [persistentUsers objectAtIndex:indexPath.row];
    
    [defaults setObject:currentTitle forKey:@"currTitle"];
    [defaults setObject:currentPost forKey:@"currPost"];
    [defaults setObject:currentUser forKey:@"currUser"];
    
    [self performSegueWithIdentifier:@"HomeToPostSegue" sender:self];
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
