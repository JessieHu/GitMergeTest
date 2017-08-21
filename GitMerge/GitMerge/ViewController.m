//
//  ViewController.m
//  GitMerge
//
//  Created by Jessie on 2017/8/15.
//  Copyright © 2017年 Jessie. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"
#import "ListViewController.h"
#import "PopoverBackgroundView.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"随便写写");
    
    Person *person = [[Person alloc] init];
    person.name  = @"Tom";
    person.age   = 12;
    person.hobby = @"Eating and Sleeping";
    NSLog(@"%@ is %zi years old, he likes %@", person.name, person.age, person.hobby);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonClicked:(id)sender {
    ListViewController *menuVC = [[ListViewController alloc] init];
    menuVC.view.backgroundColor = [UIColor lightGrayColor];
    menuVC.preferredContentSize = CGSizeMake(200, 300);
    menuVC.modalPresentationStyle = UIModalPresentationPopover;
    menuVC.popoverPresentationController.sourceView = self.view;
    menuVC.popoverPresentationController.sourceRect = self.button.frame;
    menuVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    menuVC.popoverPresentationController.delegate = self;
    menuVC.popoverPresentationController.popoverBackgroundViewClass = [PopoverBackgroundView class];
    [self presentViewController:menuVC animated:YES completion:nil];

    

}

//UIPopoverPresentationControllerDelegate,只有返回UIModalPresentationNone才可以让popover在手机上按照我们在preferredContentSize中返回的size显示。这是一个枚举，可以尝试换成其他的值尝试。
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}
// 是否可以dismiss,返回YES代表可以，返回NO代表不可以
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}

@end
