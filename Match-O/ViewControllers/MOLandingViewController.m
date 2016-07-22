//
//  LoginViewController.m
//  Match-O
//
//  Created by Andres Aguilar on 6/25/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOLandingViewController.h"
#import "MOUsersManager.h"

@interface MOLandingViewController ()

@end

@implementation MOLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MOUsersManager sharedManager];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) loginButtonTapped:(UIButton *)sender
{
    [sender setNeedsDisplay];
}

#pragma mark - Navigation
- (IBAction) prepareForUnwind: (UIStoryboardSegue*)segue
{
    
}

@end
