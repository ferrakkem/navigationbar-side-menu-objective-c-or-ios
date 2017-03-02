//
//  ViewController.m
//  Side Menu
//
//  Created by Ferrakkem on 3/2/17.
//  Copyright © 2017 Ferrakkem. All rights reserved.
//

#import "ViewController.h"
#import "DrawerView.h"

@interface ViewController ()<SlideMenuDelegate>
{
    DrawerView *drawerView;
    BOOL isSlideMenuOpen;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Hello";
}

#pragma mark ::: Create Side Menu
-(void) sideMenu
{
    UIImage *sidemenuImage = [[UIImage imageNamed:@"Icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGRect frameimage = CGRectMake(10,9, 9,20);
    UIButton *sideMenuBtn = [[UIButton alloc] initWithFrame:frameimage];
    [sideMenuBtn setBackgroundImage:sidemenuImage forState:UIControlStateNormal];
    [sideMenuBtn addTarget:self action:@selector(Menu:) forControlEvents:UIControlEventTouchUpInside];
    [sideMenuBtn setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *sideMenuButton =[[UIBarButtonItem alloc] initWithCustomView:sideMenuBtn];
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 20.0f;

    self.navigationItem.rightBarButtonItems=@[sideMenuButton,fixedItem];
}

#pragma mark ::: Side Menu Drawer Pressed
- (IBAction)sideMenu:(id)sender
{
    NSLog(@"Pressed");
    if (!isSlideMenuOpen)
    {
        if (drawerView)
        {
            [drawerView removeFromSuperview];
        }
        drawerView = [[DrawerView alloc] init];
        [drawerView setFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height)];
        [drawerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        drawerView.delegate = self;
        [self.view addSubview:drawerView];
        
        [drawerView initWithSlideMenu:self.view.frame];
        
        [self slideMenuIn];
    }
    else
    {
        [self slideMenuOut];
    }
}

- (void) slideMenuIn
{
    isSlideMenuOpen = YES;
    drawerView.hidden = NO;
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[drawerView layer] addAnimation:animation forKey:nil];
}

- (void) slideMenuOut
{
    NSLog(@"slideMenuOut");
    isSlideMenuOpen = NO;
    drawerView.hidden = YES;
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromLeft];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[drawerView layer] addAnimation:animation forKey:nil];
}

#pragma mark :::Side Menu item select
- (void) selectedIndex:(NSInteger)index
{
    NSLog(@"index  %ld", (long)index);
    
    [self slideMenuOut];
    
    switch (index)
    {
        case 0:
        {
#pragma mark ::: info_pressed
            NSLog(@"INFO");

        }
            break;
        case 1:
        {
#pragma mark ::: help_pressed
            NSLog(@"HELP");

            
        }
            break;
        case 2:
        {
#pragma mark ::: Change_Password_pressed
            NSLog(@"Change Password");

        }
            break;
            
        case 3:
        {
#pragma mark ::: Logout_pressed
            NSLog(@"Logout_pressed");
            
        }
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
