//
//  ViewController.m
//  PopupViewController
//
//  Created by serhatsezer on 8/3/14.
//  Copyright (c) 2014 serhat sezer. All rights reserved.
//

#import "ViewController.h"
#import "PopupViewController.h"

@interface ViewController ()
@property (nonatomic,strong) PopupViewController *popViewController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(!_popViewController) {
        _popViewController = [[PopupViewController alloc] initWithNibName:@"PopupViewController" bundle:[NSBundle mainBundle]];
        _popViewController.alertType = AlertViewTypeRounded;
        _popViewController.showCloseButton = YES;
        _popViewController.cornerValue = 10.0;
    }
}

- (IBAction)openPopup:(id)sender
{
    
    [_popViewController showInView:self.view title:@"Lipsum!?" message:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." animated:YES];
    
    // dismiss after 2 second delay
    // needs to be refactoring
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_popViewController dismiss];
    });
}

@end
