//
//  main.m
//  iOSGTestApp
//
//  Created by WuFeng on 16/3/17.
//  Copyright © 2016 Alloysoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <gtest/gtest.h>
//#import <XCTest/XCTest.h>


int main(int argc, char * argv[]) {
    
    @autoreleasepool {

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

//--------

//static bool isRunningTests()
//{
//    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
//    NSString* injectBundle = environment[@"XCInjectBundle"];
//    return [[injectBundle pathExtension] isEqualToString:@"xctest"];
//}
//
//int main(int argc, char *argv[])
//{
//    @autoreleasepool
//    {
//        // Running XCTests without creating any of application controllers.
//        if (isRunningTests())
//        {
//            return UIApplicationMain(argc, argv, nil, nil);
//        }
//        else {
//            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//        }
//    }
//}

//---------

//static void loadBundle(NSString * bundlePath)
//{
//    NSException * exception;
//    NSBundle * bundle = [NSBundle bundleWithPath: bundlePath];
//    if (!bundle)
//    {
//        NSString * reason = [NSString stringWithFormat:
//                             @"Could not find bundle: %@", bundlePath];
//        exception = [NSException exceptionWithName: @"BundleLoadException"
//                                            reason: reason
//                                          userInfo: nil];
//        @throw exception;
//    }
//    
//    if (![bundle load])
//    {
//        NSString * reason = [NSString stringWithFormat:
//                             @"Could not load bundle: %@", bundle];
//        exception = [NSException exceptionWithName: @"BundleLoadException"
//                                            reason: reason
//                                          userInfo: nil];
//        @throw exception;
//    }
//}
//
//int main(int argc, char * argv[])
//{
//    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//    @autoreleasepool {
//        
//        NSBundle * bundle;
//        NSString * bundlePath = [[[NSProcessInfo processInfo] environment]
//                                 objectForKey: @"TEST_LOAD_BUNDLE"];
//        
//        if (bundlePath != nil)
//        {
//            loadBundle(bundlePath);
//        }
//        
//        bundlePath =
//        [[[NSProcessInfo processInfo] arguments] objectAtIndex: 1];
//        loadBundle(bundlePath);
//        XCTestSuite * suite;
//        suite = [XCTestSuite testSuiteForBundlePath: bundlePath];
//        BOOL hasFailed = ![[suite run] hasSucceeded];
//        
//        //[pool release];
//        return ((int) hasFailed);
//    }
//    
//    return 0;
//}

