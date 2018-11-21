//
//  NSString+Helper.m
//  FounderReader-2.5
//
//  Created by chenfei on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

+ (BOOL)isNilOrEmpty:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return string == nil || [string length] == 0;
}

// 格式化时间，从字符转到时间类型
+(NSDate *)convertDateStringToDate:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *result = [formatter dateFromString:dateString];
    
    return result;
}

+(NSString *)convertIntToWeek:(NSInteger)weekInt
{
    switch (weekInt) {
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        case 1:
            return @"星期日";
            break;
            
        default:
            return @"";
            break;
    }
    
}
+(NSString *)stringFromDate:(NSDate *)date withFormate:( NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (!dateFormat)
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    else
        [dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+(NSString *)stringFromNil:(NSString*)str
{
    if (str!=nil )
        return str;
    return @"";
}

- (CGSize)sizeWithFont:(CGFloat)fontSize LineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize
{
    if ([NSString isNilOrEmpty:self]) return CGSizeMake(0, 0);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    return [self boundingRectWithSize:maxSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
}

- (NSAttributedString *)attributedTextWithFont:(CGFloat)fontSize LineSpacing:(CGFloat)lineSpacing
{
    if ([NSString isNilOrEmpty:self]) return nil;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    return [[NSAttributedString alloc] initWithString:self attributes:attributes];
}

@end
