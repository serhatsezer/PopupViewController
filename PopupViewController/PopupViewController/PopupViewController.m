//
//  PopupViewController.m
//  PopupViewController
//
//  Created by serhatsezer on 8/3/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@property (nonatomic,strong) UIView *referenceView;
@property (nonatomic,strong) UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIImageView *popupBgImageView;
@property (weak, nonatomic) IBOutlet UIView *popupAlertView;
@property (weak, nonatomic) IBOutlet UITextView *popupMessageTF;
@property (weak, nonatomic) IBOutlet UILabel *popupTitleLabel;


@end

@implementation PopupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(_alertType == AlertViewTypeRounded) {
        [self modifyImage:self.popupAlertView];
    } else {
        [self modifyImage:self.popupAlertView];
    }
    
    if(_showCloseButton && !_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setTitle:@"X" forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closePopupView) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton setTitleColor:[UIColor colorWithWhite:0.620 alpha:1.000] forState:UIControlStateNormal];
        _closeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
        _closeButton.frame = CGRectMake(self.popupAlertView.frame.size.width-30, 0, 20, 40);
        [self.popupAlertView addSubview:_closeButton];
        
    }
}

- (void) modifyImage:(UIView *)view
{
    view.clipsToBounds = YES;
    view.layer.cornerRadius = (_cornerValue) ? _cornerValue : 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self closePopupView];
}

-(void)showInView:(UIView *)view title:(NSString *)title message:(NSString *)message animated:(BOOL)animated
{
    self.referenceView = view;
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [view addSubview:self.view];
        _popupTitleLabel.text = title;
        _popupMessageTF.text = message;
        
        if(animated) {
            [self animatePopupView];
        }
        
    });
}

- (void)animatePopupView
{
    self.popupAlertView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.popupAlertView.alpha = 0;
    self.popupBgImageView.alpha = 0;
    
    [UIView animateWithDuration:.3 animations:^{
        self.popupBgImageView.alpha = 1;
        self.popupAlertView.alpha = 1;
        self.popupAlertView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}




-(void)dismiss {

    if(self.popupAlertView) {
        self.popupBgImageView.alpha = 0.0;
        self.popupAlertView.transform = CGAffineTransformMakeScale(1., 1.);
        self.popupAlertView.alpha = 0.0;
        [self.view removeFromSuperview];
    }
}

- (void)dismissWithAnimation {
    if(self.popupAlertView) {
        [self closePopupView];
    }
}

-(void)viewDidLayoutSubviews
{
    self.popupAlertView.layer.anchorPoint = CGPointMake(.5, .5);
    self.popupAlertView.layer.position = CGPointMake(self.referenceView.bounds.size.width / 2,
                                                     self.referenceView.bounds.size.height / 2);
}

- (void)closePopupView
{
    [UIView animateWithDuration:.3 animations:^{
        self.popupBgImageView.alpha = 0.0;
        self.popupAlertView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        self.popupAlertView.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.popupAlertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.popupBgImageView.alpha = 1.0;
        [self.view removeFromSuperview];
    }];
}


@end
