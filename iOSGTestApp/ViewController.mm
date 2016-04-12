//
//  ViewController.m
//  iOSGTestApp
//
//  Created by WuFeng on 16/3/17.
//  Copyright © 2016 Alloysoft. All rights reserved.
//

#import "ViewController.h"
#import "Counter.h"
//#import <XCTest/XCTest.h>
//#import "iOSGTestAppUITests.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    
    Counter counter;
    counter.Increment();
    counter.GetCount();
    
//    int index = 1;
//    while (true) {
//        NSLog(@"%i", index++);
//        _lblCounter.text = [NSString stringWithFormat:@"%i", index];
//    }

    
//    iOSGTestAppUITests *testCase = [[iOSGTestAppUITests alloc] init];
//    [testCase runTest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
