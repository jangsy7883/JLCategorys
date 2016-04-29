//
//  NSDate+JLAdditions.m
//  JLCategory
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSDate+JLAdditions.h"
#import "NSTimeZone+JLAdditions.h"

@implementation NSDate (Additions)

+ (NSDateFormatter*)sharedDateFormatter
{
    static dispatch_once_t once;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&once, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone GMT];
        dateFormatter.locale = [NSLocale currentLocale];
    });
    return dateFormatter;
}

+ (NSCalendar *) currentCalendar
{
    static dispatch_once_t once;
    static NSCalendar *sharedCalendar;
    dispatch_once(&once, ^{
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    });
    return sharedCalendar;
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString withTimeZone:(NSTimeZone*)timeZone
{
    if ([dateString isKindOfClass:[NSString class]] && dateString.length > 0)
    {
        NSDateFormatter *dateFormatter = [self sharedDateFormatter];
        if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
        {
            dateFormatter.timeZone = timeZone;
        }
        
        dateFormatter.dateFormat = dateFormat;
        
        return [dateFormatter dateFromString:dateString];
    }
    return nil;
}

+ (NSDate*)dateFromFormat:(NSString*)dateFormat dateString:(NSString*)dateString
{
    return [self dateFromFormat:dateFormat
                     dateString:dateString
                   withTimeZone:[NSTimeZone GMT]];
}

- (NSString*)stringFromFormat:(NSString*)stringFormat withTimeZone:(NSTimeZone*)timeZone
{
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter];
    if ([dateFormatter.timeZone isEqualToTimeZone:timeZone] == NO)
    {
        dateFormatter.timeZone = timeZone;
    }

    dateFormatter.dateFormat = stringFormat;
    
    return [dateFormatter stringFromDate:self];
}

- (NSString*)stringFromFormat:(NSString*)parm_stringFormat
{
    return [self stringFromFormat:parm_stringFormat
                     withTimeZone:[NSTimeZone GMT]];
}


#pragma mark - Unit

- (NSInteger)valueForUnit:(NSCalendarUnit)unit
{
    NSDateComponents *components = [[NSDate currentCalendar] components:unit fromDate:self];
    
    switch (unit)
    {
        case NSCalendarUnitEra:
            return components.era;
            break;
        case NSCalendarUnitYear:
            return components.year;
            break;
        case NSCalendarUnitMonth:
            return components.month;
            break;
        case NSCalendarUnitDay:
            return components.day;
            break;
        case NSCalendarUnitHour:
            return components.hour;
            break;
        case NSCalendarUnitMinute:
            return components.month;
            break;
        case NSCalendarUnitSecond:
            return components.second;
            break;
        case NSCalendarUnitNanosecond:
            return components.nanosecond;
            break;
        case NSCalendarUnitWeekday:
            return components.weekday;
            break;
        case NSCalendarUnitWeekdayOrdinal:
            return components.weekdayOrdinal;
            break;
        case NSCalendarUnitQuarter:
            return components.quarter;
            break;
        case NSCalendarUnitWeekOfMonth:
            return components.weekOfMonth;
            break;
        case NSCalendarUnitWeekOfYear:
            return components.weekOfYear;
            break;
        case NSCalendarUnitYearForWeekOfYear:
            return components.yearForWeekOfYear;
            break;
        default:
            return 0;
            break;
    }
}

- (NSDate*)dateByAddingCount:(NSInteger)count forUnit:(NSCalendarUnit)unit
{
    NSDateComponents *components = [[NSDate currentCalendar] components:unit fromDate:self];
    
    switch (unit)
    {
        case NSCalendarUnitEra:
            components.era = components.era + count;
            break;
        case NSCalendarUnitYear:
            components.year = components.year + count;
            break;
        case NSCalendarUnitMonth:
            components.month = components.month + count;
            break;
        case NSCalendarUnitDay:
            components.day = components.day + count;
            break;
        case NSCalendarUnitHour:
            components.hour = components.hour + count;
            break;
        case NSCalendarUnitMinute:
            components.month = components.month + count;
            break;
        case NSCalendarUnitSecond:
            components.second = components.second + count;
            break;
        case NSCalendarUnitNanosecond:
            components.nanosecond = components.nanosecond + count;
            break;
        case NSCalendarUnitWeekday:
            components.weekday = components.era + count;
            break;
        case NSCalendarUnitWeekdayOrdinal:
            components.weekdayOrdinal = components.weekdayOrdinal + count;
            break;
        case NSCalendarUnitQuarter:
            components.quarter = components.quarter + count;
            break;
        case NSCalendarUnitWeekOfMonth:
            components.weekOfMonth = components.weekOfMonth + count;
            break;
        case NSCalendarUnitWeekOfYear:
            components.weekOfYear = components.weekOfYear + count;
            break;
        case NSCalendarUnitYearForWeekOfYear:
            components.yearForWeekOfYear = components.yearForWeekOfYear + count;
            break;
            
        default:
            break;
    }
    return components.date;
}

#pragma mark - Equal

- (BOOL)isEqualDayToDate:(NSDate *)date
{
    NSCalendarUnit componentFlags = (NSCalendarUnitYear|
                                     NSCalendarUnitMonth |
                                     NSCalendarUnitDay);
    
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:date];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

#pragma mark - GETTERS

- (BOOL)isToday
{
    return [self isEqualDayToDate:[NSDate date]];
}

- (NSInteger)year
{
    return [self valueForUnit:NSCalendarUnitYear];
}

- (NSInteger)month
{
    return [self valueForUnit:NSCalendarUnitMonth];
}

- (NSInteger)day
{
    return [self valueForUnit:NSCalendarUnitDay];
}

- (NSInteger)hour
{
    return [self valueForUnit:NSCalendarUnitHour];
}

- (NSInteger)minute
{
    return [self valueForUnit:NSCalendarUnitMinute];
}

- (NSInteger)second
{
    return [self valueForUnit:NSCalendarUnitSecond];
}

@end
