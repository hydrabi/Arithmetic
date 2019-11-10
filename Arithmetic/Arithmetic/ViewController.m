//
//  ViewController.m
//  Arithmetic
//
//  Created by iMac on 2018/7/29.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "ViewController.h"
#import "Section1.h"
#import "SortAnswer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Section1 *secion1 = [[Section1 alloc] init];
    [secion1 start];
    
    [SortAnswer answer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
