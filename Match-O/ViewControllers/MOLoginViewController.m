//
//  MOLoginViewController.m
//  Match-O
//
//  Created by Andres Aguilar on 7/21/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOLoginViewController.h"
#import "MOUsersManager.h"

@interface MOLoginViewController () <MOUsersManagerDelegate>

@property (nonatomic, weak) IBOutlet UITextField* usernameTextfield;
@property (nonatomic, weak) IBOutlet UITextField* passwordTextfield;

@end

@implementation MOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User interaction
- (IBAction) loginButtonTapped
{
    MOUsersManager *usersManager = [MOUsersManager sharedManager];
    usersManager.delegate = self;
    [[MOUsersManager sharedManager] loginWithUsername:self.usernameTextfield.text password:self.passwordTextfield.text];
}


#pragma mark - MOUsersManagerDelegate
- (void) userDidLogin:(BOOL)success
{
    
}

@end
