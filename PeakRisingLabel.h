//
//
//  Created by conis on 7/4/13.
//  Copyright (c) 2013 conis. All rights reserved.
//  Blog: http://iove.net
//  E-mail: conis.yi@gmail.com
//  动态展示上升的数字，并可以对这个数字进行格式化。需要使用ARC。

#import <UIKit/UIKit.h>

@protocol PeakRisingLabelDelegate;

@interface PeakRisingLabel : UILabel

//委托
@property (nonatomic, weak) id<PeakRisingLabelDelegate> delegate;
//格式化字符，默认格式为%.0f%
@property (nonatomic, strong) NSString *formatter;
//是否自动调整大小
@property (nonatomic) BOOL autoSize;
//开始的数值
@property (nonatomic) CGFloat fromValue;
//结束的数值
@property (nonatomic) CGFloat toValue;

-(void) updateTo: (CGFloat) toValue;
-(void) updateTo: (CGFloat) toValue animation: (BOOL) animation;
-(void) updateTo: (CGFloat) toValue fromValue: (CGFloat) fromValue duration: (CGFloat) duration animation: (BOOL) animation;
-(void) updateLastTo: (CGFloat) toValue animation: (BOOL) animation;
@end

@protocol PeakRisingLabelDelegate <NSObject>
-(NSString *) peakRisingLabel: (PeakRisingLabel *) risingLabel formatWith: (NSString *) formatter value: (CGFloat) value;
@end
