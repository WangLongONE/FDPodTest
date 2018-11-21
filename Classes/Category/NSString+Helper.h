//
//  NSString+Helper.h
//  FounderReader-2.5
//
//  Created by chenfei on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface NSString (Helper)

+ (BOOL)isNilOrEmpty:(NSString *)string;

+(NSString *)stringFromDate:(NSDate *)date withFormate:( NSString *)dateFormat;

+(NSString *)stringFromNil:(NSString*)str;

/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */

- (CGSize)sizeWithFont:(CGFloat)fontSize LineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize;

/* 获取特定字符串 */
- (NSAttributedString *)attributedTextWithFont:(CGFloat)fontSize LineSpacing:(CGFloat)lineSpacing;

@end
