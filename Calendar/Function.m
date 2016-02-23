//
//  Function.m
//  Calendar
//
//  Created by 朝倉明俊 on H28/02/19.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

#import "Function.h"

@implementation Function

// initialize function
+(id)initFunction {
    return [[self alloc] init];
}

// dataType 0 is year, other is month
// check number is right or not
-(BOOL)checkNum:(int)dataValue dataType:(int)dataType {
    if (dataValue) {
        if (dataType == 0) {
            return true;
        } else if (dataValue < 1 || dataValue > 12) {
            printf("入力した月が存在しません！");
            return false;
        } else {
            return true;
        }
    } else {
        printf("数字を入力してください");
        return false;
    }
}

// get input data
-(int)getDataByType:(int)dataType {
    int dataInt = 0;
    BOOL dataTyped = false;
    Function* function = [Function initFunction];
    for (BOOL dataGetted = false; dataGetted == false;) {
        if (dataType == 0) {
            printf("年を入力してください：");
        } else {
            printf("月を入力してください：");
        }if (dataTyped == false) {
            scanf("%d", &dataInt);
            dataTyped = true;
        }
        if (dataTyped == true) {
            if ([function checkNum:dataInt dataType:dataType]) {
                dataGetted = true;
            } else {
                dataTyped = false;
            }
        }
    }
    return dataInt;
}

// caculate how many days have in a month
-(int)dayPerMonthByYear:(int)year Month:(int)month {
    // number of days for each month
    int dayPerMonth[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    // if is leap year
    if (year %4 == 0) {
        // change days of Fer to 29
        dayPerMonth[1] = 29;
    }
    // return data
    return dayPerMonth[month - 1];
}

// caculate the first day of the month is which day of the week
-(int)dayWeeksByYear:(int)year Month:(int)month {
    if (month <= 2) {
        month += 12;
        year--;
    }
    int dayWeeks = (2 + 2 * month + 3 * (month + 1) / 5 + year + year / 4 - year / 100 + year / 400) % 7;
    return dayWeeks;
}

// output calendar
-(void)outputCalendarByYear:(int)year Month:(int)month DayPerMonth:(int)dayPerMonth DayWeeks:(int)dayWeeks {
    int yearJapanese = 0;
    int type;
    // if year after 1926
    if (year >= 1926) {
        // if is 1926
        if (year == 1926) {
            // if month before December
            if (month != 12) {
                // JPN type is Taisho 26
                type = 0;
            } else {
                // JPN type is Taisho 26 and Showa 1
                type = 1;
            }
        // if year between 1926 and 1989
        } else if (year < 1989) {
            // caculate JPN year
            yearJapanese = year - 1926 + 1;
            // JPN type is Showa
            type = 2;
        } else if (year >= 1989) {
            // if is Jan 1989
            if (year == 1989 && month == 1) {
                // JPN type is Showa 64 and Heisei 1
                type = 3;
            } else {
                // caculate JPN year
                yearJapanese = year - 1989 + 1;
                // JPN type is Heisei
                type = 4;
            }
        }
    } else {
        type = 5;
    }
    switch (type) {
        case 0:
            printf("大正26年");
            break;
        case 1:
            printf("大正26年（12月25日まで）\n");
            printf("昭和元年（12月25日から）");
            break;
        case 2:
            printf("昭和%d年", yearJapanese);
            break;
        case 3:
            printf("昭和64年（1月7日まで）\n");
            printf("平成元年（1月8日から）");
            break;
        case 4:
            if (yearJapanese == 1) {
                printf("平成元年");
            } else {
                printf("平成%d年", yearJapanese);
            }
        case 5:
            break;
        default:
            break;
    }
    printf("\n西暦%d年%d月\n", year, month);
    printf("--------------------------\n");
    printf("日  月　 火  水　 木  金　 土\n");
    for (int i = 0; i != dayWeeks; i++) {
        printf("    ");
    }
    for (int i = 0; i != dayPerMonth; i++) {
        printf("%d", i + 1);
        if (i < 9) {
            printf("   ");
        } else {
            printf("  ");
        }
        if ((i + dayWeeks + 1) % 7 == 0) {
            printf("\n");
        }
    }
}

@end
