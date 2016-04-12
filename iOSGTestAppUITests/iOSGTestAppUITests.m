//
//  iOSGTestAppUITests.m
//  iOSGTestAppUITests
//
//  Created by WuFeng on 16/3/17.
//  Copyright © 2016 Alloysoft. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface iOSGTestAppUITests : XCTestCase

@end

@implementation iOSGTestAppUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
//    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *fileName = @"log.txt";
//    
//    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
//    [fileManager createFileAtPath:fileName contents:nil attributes:nil];
//    
//    //[fileManager removeItemAtPath:@"createdNewFile" error:nil];
//    
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
//    NSString *temp = @"Hello test...";
////    int data0 = 100000;
////    float data1 = 23.45f;
//    
//    NSMutableData *writer = [[NSMutableData alloc] init];
//    [writer appendData:[temp dataUsingEncoding:NSUTF8StringEncoding]];
////    [writer appendBytes:&data0 length:sizeof(data0)];
////    [writer appendBytes:&data1 length:sizeof(data1)];
//    
//    [writer writeToFile:path atomically:YES];
    
}


// TODO: how to export the testing log to a file on a real device?


@end
