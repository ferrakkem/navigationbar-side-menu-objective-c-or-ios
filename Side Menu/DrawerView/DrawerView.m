//
//  DrawerView.m
//  CustomSlideMenu
//
//  Created by Ferrakkem on on 3/2/17.
//  Copyright © 2017 Ferrakkem. All rights reserved.
//

#import "DrawerView.h"
#import "UIImage+ResizeImage.h"
//#import "Global.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation DrawerView


- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
    // Initialization code
    //[self createVerticalScroll];
}

- (void) tapGestureProfileImage:(UITapGestureRecognizer *)tap
{
    [self.delegate selectedIndex:5];
    NSLog(@"profile image tab");
}

- (void) initWithSlideMenu:(CGRect)rect
{
    float height = 0;
    
    UIView *menuBg = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width/2, height, rect.size.width*0.8, rect.size.height)];
    menuBg.backgroundColor = UIColorFromRGB(0x1f1f1f);
    [self addSubview:menuBg];
    
    
    height = 0;


    menuName = [NSArray arrayWithObjects:@"INFO",@"HELP",@"CHANGE PASSWORD",@"LOGOUT", nil];
    NSArray *image = [NSArray arrayWithObjects:@"info.png",@"help.png",@"chenge_password.png",@"logout.png", nil];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, height, menuBg.bounds.size.width, menuBg.bounds.size.height - (height + 50))];
    int buttonY = 0;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, buttonY);
    
    int count = (int)[menuName count];
    for (int i = 0; i < count; i++)
    {
        UIView *listView = [[UIView alloc] initWithFrame:CGRectMake(0, buttonY , menuBg.bounds.size.width, 44)];
        listView.backgroundColor = UIColorFromRGB(0x1f1f1f);
        [scrollView addSubview:listView];
        
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.backgroundColor = UIColorFromRGB(0x2d2d2d).CGColor;
        bottomBorder.frame = CGRectMake(listView.bounds.size.height/2 + 30, CGRectGetHeight(listView.frame), CGRectGetWidth(listView.frame), 1.0f);
        [listView.layer addSublayer:bottomBorder];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, menuBg.bounds.size.width, 44)];
        button.tag = i;
        button.backgroundColor = [UIColor clearColor];
        [listView addSubview:button];
        buttonY = buttonY + listView.frame.size.height + 1;
        [button addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
        [listView addSubview:button];
        
        UIImageView *setImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, listView.bounds.size.height/4, listView.bounds.size.height/2, listView.bounds.size.height/2)];
        setImage.image = [UIImage imageNamed:[image objectAtIndex:i]];
        setImage.contentMode = UIViewContentModeScaleAspectFill;
        [button addSubview:setImage];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(listView.bounds.size.height/2 + 30, listView.bounds.size.height/2 - 11 , listView.bounds.size.width/2, 22)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"OpenSans-Reguler" size:13.0];
        label.text = [menuName objectAtIndex:i];
        label.numberOfLines =0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = UIColorFromRGB(0x666572);
        label.textAlignment = NSTextAlignmentLeft;
        [button addSubview:label];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, buttonY + 20);
    scrollView.backgroundColor = [UIColor clearColor];
    [menuBg addSubview:scrollView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(menuBg.frame.size.width*0.25, menuBg.frame.size.height - 45, menuBg.frame.size.width*0.5, 35)];
    button.tag = count + 1;
    button.layer.cornerRadius = 3.0;
    button.backgroundColor = UIColorFromRGB(0x1665c1);
    button.titleLabel.font = [UIFont fontWithName:@"OpenSans-Reguler" size:13.0];
    [button setTitle:@"Logout" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
   // [menuBg addSubview:button];
    
//    UILabel *serverTime = [[UILabel alloc] initWithFrame:CGRectMake(0, menuBg.bounds.size.height - 40, menuBg.bounds.size.width, 20)];
//    serverTime.backgroundColor = [UIColor clearColor];
//    serverTime.font = [UIFont fontWithName:@"OpenSans-Reguler" size:14.0];
//    serverTime.text = @"Server Time: 10:00 AM";
//    serverTime.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
//    serverTime.textAlignment = NSTextAlignmentCenter;
//    [menuBg addSubview:serverTime];

}

//The event handling method
//- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
//{
//    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
//    
//    NSLog(@"location x:%f  location y:%f",location.x,location.y);
//     if (location.x > self.bounds.size.width*0.4)
//      {
//        [self.delegate closeDrawerMenu];
//    //}
//}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInView:self];
    if (location.x < self.bounds.size.width*0.4)
    {
        [self.delegate closeDrawerMenu];
    }
}

- (void) selectedButton:(UIButton*)btn{
    NSLog(@"selectedButton");
    
    if (btn.tag == [menuName count] + 1) {
        [self.delegate selectedIndex:btn.tag];
        return;
    }
   
    [preButton setBackgroundColor:UIColorFromRGB(0xFFFFFF)];
    NSArray *subviewsPre = preButton.subviews;
    for (UIView *subview in subviewsPre)
    {
        if ([subview isKindOfClass:[UILabel class]])
        {
            UILabel *newLbl = (UILabel *)subview;
            newLbl.textColor = UIColorFromRGB(0x7e888f);
        }
        else if([subview isKindOfClass:[UIImageView class]])
        {
            UIImageView *newImg = (UIImageView *)subview;
            newImg.image = [newImg.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [newImg setTintColor:UIColorFromRGB(0x7e888f)];
        }
    }
    
    [btn setBackgroundColor:UIColorFromRGB(0x1665c1)];
    NSArray *subviews = btn.subviews;
    for (UIView *subview in subviews)
    {
        if ([subview isKindOfClass:[UILabel class]])
        {
            UILabel *newLbl = (UILabel *)subview;
            newLbl.textColor = UIColorFromRGB(0xFFFFFF);
        }
        else if([subview isKindOfClass:[UIImageView class]])
        {
            UIImageView *newImg = (UIImageView *)subview;
            newImg.image = [newImg.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [newImg setTintColor:UIColorFromRGB(0xFFFFFF)];
        }
    }
    preButton = btn;
   
    NSInteger tagValue;
    if (btn.tag == 0) {
        tagValue = 0;
    }
    else{
        tagValue = btn.tag + 1;
    }
    
    [self.delegate selectedIndex:tagValue];
}

@end
