//
//  PopoverBackgroundView.h
//  GitMerge
//
//  Created by Jessie on 2017/8/18.
//  Copyright © 2017年 Jessie. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义弹出框背景.
 http://www.scianski.com/customizing-uipopover-with-uipopoverbackgroundview/
 */
@interface PopoverBackgroundView : UIPopoverBackgroundView

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIView *bgView;

@end
