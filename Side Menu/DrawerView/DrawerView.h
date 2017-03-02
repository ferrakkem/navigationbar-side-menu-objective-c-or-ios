//
//  DrawerView.h
//  CustomSlideMenu
//
//  Created by Ferrakkem on on 3/2/17..
//  Copyright © 2017 Ferrakkem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuDelegate <NSObject>
- (void) selectedIndex:(NSInteger)index;
- (void) closeDrawerMenu;
@end

@interface DrawerView : UIView
{
    UIScrollView *scrollView;
    UIButton *preButton;
    NSArray *menuName;
}

@property (nonatomic, weak) id <SlideMenuDelegate> delegate;

- (void) initWithSlideMenu:(CGRect)rect;

@end
