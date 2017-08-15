//
//  Person.h
//  GitMerge
//
//  Created by Jessie on 2017/8/15.
//  Copyright © 2017年 Jessie. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 人.
@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *hobby;

@end
