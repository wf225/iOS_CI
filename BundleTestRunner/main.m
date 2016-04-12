//
//  main.m
//  BundleTestRunner
//
//  Created by WuFeng on 16/3/21.
//  Copyright © 2016 Alloysoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

static void loadBundle(NSString * bundlePath)
{
    NSException * exception;
    NSBundle * bundle = [NSBundle bundleWithPath: bundlePath];
    if (!bundle)
    {
        NSString * reason = [NSString stringWithFormat:
                             @"Could not find bundle: %@", bundlePath];
        exception = [NSException exceptionWithName: @"BundleLoadException"
                                            reason: reason
                                          userInfo: nil];
        @throw exception;
    }
    
    if (![bundle load])
    {
        NSString * reason = [NSString stringWithFormat:
                             @"Could not load bundle: %@", bundle];
        exception = [NSException exceptionWithName: @"BundleLoadException"
                                            reason: reason
                                          userInfo: nil];
        @throw exception;
    }
}

int main(int argc, char * argv[])
{
    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    @autoreleasepool {
        
        NSBundle * bundle;
        NSString * bundlePath = [[[NSProcessInfo processInfo] environment]
                                 objectForKey: @"TEST_LOAD_BUNDLE"];
        
        if (bundlePath != nil)
        {
            loadBundle(bundlePath);
        }
        
        bundlePath =
        [[[NSProcessInfo processInfo] arguments] objectAtIndex: 1];
        loadBundle(bundlePath);
        XCTestSuite * suite;
        suite = [XCTestSuite testSuiteForBundlePath: bundlePath];
        BOOL hasFailed = ![[suite run] hasSucceeded];
        
        //[pool release];
        return ((int) hasFailed);
    }
    
    return 0;
}
