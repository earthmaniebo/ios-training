//
//  EBBLoginViewController.m
//  EarthBulletinBoard
//
//  Created by Earth Ponce Maniebo on 12/9/14.
//  Copyright (c) 2014 Seer Technologies, Inc. All rights reserved.
//

#import "EBBLoginViewController.h"

@interface EBBLoginViewController () {
    UITextField *activeField;
    NSArray *users;
    NSMutableArray *passwords;
    NSString *msg;
    UIAlertView *alertView;
    NSMutableArray *titles;
}
@end

@implementation EBBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeContents];
    [self registerForKeyboardNotifications];
    users = [[NSArray alloc] initWithObjects:@"earth", @"vaughn", nil];
    passwords = [[NSMutableArray alloc] initWithObjects:@"maniebo", @"armada", nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.view resignFirstResponder];
    self.loginView.usernameTextField.text = @"";
    self.loginView.passwordTextField.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)initializeContents {
    // Load xib file
    self.loginView = (EBBLoginView*)[self getCustomXibUsingXibName:@"LoginView"];
    self.loginView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    // Set Delegates
    self.loginView.delegate = self;
    self.loginView.usernameTextField.delegate = self;
    self.loginView.passwordTextField.delegate = self;
    
    self.navigationItem.title = @"Login";
    
    [self.view addSubview:self.loginView];
}

- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - UITextField Delegates
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    activeField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - EBBLoginView Delegates
- (void)loginButtonPressed {
    // Store textfield text
    NSString *inputUsername = self.loginView.usernameTextField.text;
    NSString *inputPassword = self.loginView.passwordTextField.text;
    
    // Check if fields are empty
    if (![inputUsername isEqualToString:@""] && ![inputPassword isEqualToString:@""]) {
        // Check if inputs are correct
        if ([users containsObject:inputUsername] && [passwords containsObject:inputPassword]) {
            // Check if same index
            NSInteger userIndex = [users indexOfObject:inputUsername];
            NSInteger passwordIndex = [passwords indexOfObject:inputPassword];
            if (userIndex == passwordIndex) {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:inputUsername forKey:@"username"];
                [self performSegueWithIdentifier:@"LoginToHomeViewSegue" sender:self];
            } else {
                msg = @"WTF BRUH?!";
                alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
        } else {
            msg = @"Wrong username or password.";
            alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    } else {
        msg = @"Please fill up all the fields.";
        alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

#pragma mark - Keyboard
- (void)keyboardWasShown:(NSNotification *)aNotification {
    // Get size of displayed keyboard
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Compute visible active field
    CGRect visibleActiveFieldRect = CGRectMake(activeField.frame.origin.x, activeField.frame.origin.y + kbSize.height + 10, activeField.frame.size.width, activeField.frame.size.height);
    
    // Adjust scroll view content size
    self.loginView.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 40);
    
    // Scroll to visible active field
    [self.loginView.scrollView scrollRectToVisible:visibleActiveFieldRect animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    // Reset the content size of the scroll view
    self.loginView.scrollView.contentSize = CGSizeMake(0.0, 0.0);
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
