//
//  Function.h
//  Calendar
//
//  Created by 朝倉明俊 on H28/02/19.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOG_DEBUG

#define __PREPEND_DATE(format)  ([NSString stringWithFormat:@"[%@] %@", [[[NSDate new] description] componentsSeparatedByString:@" "][1], [@"%@" stringByAppendingString:format]])
#define SLog(args,...) do { [[NSFileHandle fileHandleWithStandardOutput] writeData:[[NSString stringWithFormat:__PREPEND_DATE(args), @"", ##__VA_ARGS__] dataUsingEncoding: NSUTF8StringEncoding]]; [[NSFileHandle fileHandleWithStandardOutput] writeData: [@"\n" dataUsingEncoding: NSUTF8StringEncoding]]; } while(0);

#ifdef LOG_DEBUG
#define NSLog SLog
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

// DLog displays current method and line where the log call starts. Won't log when non in LOG_DEBUG mode
#ifdef LOG_DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DLog(...)
#endif

@interface Function : NSObject

// initialize function
+(id)initFunction;

// check number is right or not
-(BOOL)checkNum:(int)dataValue
       dataType:(int)dataType;

// get input data
-(int)getDataByType:(int)dataType;

// caculate how many days have in a month
-(int)dayPerMonthByYear:(int)year
                   Month:(int)month;

// caculate the first day of the month is which day of the week
-(int)dayWeeksByYear:(int)year
                Month:(int)month;

// output calendar
-(void)outputCalendarByYear:(int)year
                      Month:(int)month
                DayPerMonth:(int)dayPerMonth
                   DayWeeks:(int)dayWeeks;

@end
