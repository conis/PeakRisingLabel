//
//  PeakRisingLabel
//  Created by conis on 7/4/13.
//  Copyright (c) 2013 conis. All rights reserved.
//

#import "PeakRisingLabel.h"

@interface PeakRisingLabel()
//当前的值
@property (nonatomic) CGFloat currentValue;
//步长
@property (nonatomic) CGFloat stepValue;
//计时器
@property (nonatomic, strong) NSTimer *mainTimer;
@end


@implementation PeakRisingLabel

#pragma mark 初始化

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      [self setDefaults];
    }
    return self;
}

- (id)init
{
  self = [super init];
  if (self) {
    [self setDefaults];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self setDefaults];
  }
  return self;
}

-(void) setDefaults{
  //默认显示百分比
  _autoSize = NO;
  _formatter = @"%.0f%%";
}
//更新监视
-(void) updateMonitor{
  if(self.delegate && [self.delegate respondsToSelector: @selector(peakRisingLabel:formatWith:value:)]){
    self.text = [self.delegate peakRisingLabel:self formatWith:self.formatter value:self.currentValue];
  }else{
    self.text = [NSString stringWithFormat: self.formatter, self.currentValue];
  }
  //自动大小
  if(_autoSize) [self sizeToFit];
}

//更新到某个值，自动启用动画
-(void) updateTo:(CGFloat)toValue{
  [self updateTo:toValue animation:NO];
}

//更新到某个值，可以选择启用动画
-(void) updateTo:(CGFloat)toValue animation:(BOOL)animation{
  [self updateTo:toValue fromValue:self.fromValue duration:0.4 animation:animation];
}

//更新上一次的to到指定的某个值，例如上一次是更新到80%，本次是90%，即是更新80至90
-(void) updateLastTo:(CGFloat)toValue animation:(BOOL)animation{
  [self updateTo:toValue fromValue:self.toValue duration:0.4 animation: animation];
}
-(void) updateTo:(CGFloat)toValue fromValue:(CGFloat)fromValue duration:(CGFloat)duration animation:(BOOL)animation{
  //值没有改变，不需要处理
  if(self.fromValue == fromValue && self.toValue == toValue){
    self.currentValue = toValue;
    [self updateMonitor];
    return;
  }
  

  self.fromValue = fromValue;
  self.toValue = toValue;
  //直接更新，不用动画
  if(!animation){
    //当前值是最终值
    self.currentValue = toValue;
    [self updateMonitor];
    return;
  }
  
  //初始值 
  self.currentValue = fromValue;
  //每0.1秒更新一次
  NSTimeInterval val = 0.05;
  //步长
  self.stepValue = (self.toValue - self.fromValue) / (duration / val);

  //停止现在的计算器
  [self.mainTimer invalidate];
  self.mainTimer = nil;
  //启动新的计时器
  self.mainTimer = [NSTimer scheduledTimerWithTimeInterval:val target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
}
//启动记时器
-(void) handleTimer:(NSTimer *)timer{
  CGFloat minValue = fminf(_fromValue, _toValue);
  CGFloat maxValue = fmaxf(_fromValue, _toValue);
  
  self.currentValue += self.stepValue;
  self.currentValue = fminf(maxValue, self.currentValue);
  self.currentValue = fmaxf(minValue, self.currentValue);
  
  //当前值不在范围内
  if(self.currentValue <= minValue || self.currentValue >= maxValue){
    self.currentValue = self.toValue;
    [self updateMonitor];
    [self.mainTimer invalidate];
    self.mainTimer = nil;
    return;
  }
  
  [self updateMonitor];
}

//重新更新监视
-(void) setFormatter:(NSString *)formatter{
  _formatter = formatter;
  [self updateMonitor];
}
@end
