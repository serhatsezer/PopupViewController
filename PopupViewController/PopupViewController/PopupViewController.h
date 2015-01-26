//
//  PopupViewController.h
//  PopupViewController
//
//  Created by serhatsezer on 8/3/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    AlertViewTypeRounded = 0,
    AlertViewTypeNormal = 1
}AlertViewType;

@interface PopupViewController : UIViewController

@property(nonatomic,assign) AlertViewType alertType;
@property(nonatomic,assign) NSInteger cornerValue;
@property(nonatomic,assign) BOOL showCloseButton;

- (void)showInView:(UIView *)view title:(NSString *)title message:(NSString *)message animated:(BOOL)animated;
- (void)dismiss;
- (void)dismissWithAnimation;


@end
