//
//  ViewController.m
//  Bangla Cat Rental
//
//  Created by Ferrakkem Bhuiyan on 11/9/16.
//  Copyright © 2016 Btrac. All rights reserved.
//


#ifndef Global_h
#define Global_h

#define screenWidth        [UIScreen mainScreen].bounds.size.width
#define screenHeight       [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT       [NSUserDefaults standardUserDefaults]
#define APP_DELEGATE       (AppDelegate *) [[UIApplication sharedApplication]delegate]

#define LOGIN_URL           @"http://103.9.185.218/cat_rental/api/v1/authenticate"
#define FORGOT_PASSWORD     @"http://103.9.185.218/cat_rental/api/v1/forgot_password"
#define RESET_PASSWORD      @"http://103.9.185.218/cat_rental/api/v1//reset_password"
#define HOME_PAGE_VIDEO     @""




//Get color from hexa value
// call as [self setSeparatorColor:UIColorFromRGB(0x00acc3)];
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif /* Global_h */
