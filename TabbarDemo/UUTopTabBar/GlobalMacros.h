//
//  GlobalMacros.h
//  SCNavTabBarController
//
//  Created by Ge￼ on 14-1-6.
//  Copyright (c) 2015 Ge. All rights reserved.
//

#define IMAGE(NAME)                                 [UIImage imageNamed:NAME]
#define CLEAR_COLOR                                 [UIColor clearColor]
#define UIColorOfHex(color)                         [UIColor colorWithHex:(color) alpha:1.0]

#define FONT_OF_SIZE(size)                          [UIFont systemFontOfSize:size]

#define kMainScreenBounds                           ([[UIScreen mainScreen] bounds])
#define kMainScreenWidth                            ([[UIScreen mainScreen] bounds].size.width)
#define kMainScreenHeight                           ([[UIScreen mainScreen] bounds].size.height)
#define kNaviViewHeight                             (kMainScreenHeight - 64)
#define IS_4INCH_SCREEN                             ([UIScreen instancesRespondToSelector:@selector(currentMode)] \
                                                        ? CGSizeEqualToSize(CGSizeMake(640, 1136), \
                                                        [[UIScreen mainScreen] currentMode].size) : NO)

#define SYSTEM_VERSION                              [[UIDevice currentDevice] systemVersion]
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedDescending)
#define IS_IOS7_OR_LATER                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7"))

#define CURRENT_APP_VERSION                         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kMainStoryBoard                             [UIStoryboard storyboardWithName:@"Main" bundle:nil]


#ifndef SINGLETON_GCD
#define SINGLETON_GCD(classname)                    \
                                                    \
+ (classname *)shared##classname {                  \
static dispatch_once_t pred;                        \
__strong static classname * shared##classname = nil;\
dispatch_once( &pred, ^{                            \
shared##classname = [[self alloc] init]; });        \
return shared##classname;                           \
}
#endif