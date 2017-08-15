//
//  ViewController.m
//  GitMerge
//
//  Created by Jessie on 2017/8/15.
//  Copyright © 2017年 Jessie. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()

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


@end
