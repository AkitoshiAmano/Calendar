//
//  main.m
//  Calendar
//
//  Created by 朝倉明俊 on H28/02/19.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Function.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int year, month, dayPerMonth, dayWeeks;
        Function* function = [Function initFunction];
        year = [function getDataByType:0];
        month = [function getDataByType:1];
        dayPerMonth = [function dayPerMonthByYear:year Month:month];
        dayWeeks = [function dayWeeksByYear:year Month:month];
        [function outputCalendarByYear:year Month:month DayPerMonth:dayPerMonth DayWeeks:dayWeeks];
        printf("\n");
    }
    return 0;
}
