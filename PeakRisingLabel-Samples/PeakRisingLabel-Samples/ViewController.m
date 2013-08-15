//
//  ViewController.m
//  Samples
//
//  Created by conis on 8/15/13.
//  Copyright (c) 2013 conis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.timeLabel.delegate = self;
  self.timeLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size: 50];
  [self.percentLabel updateTo:100 animation:YES];
  [self.timeLabel updateTo:1000 fromValue:0 duration:2 animation:YES];
}

//重新格式化时间，以00:00:00的方式显示
-(NSString *) peakRisingLabel:(PeakRisingLabel *)risingLabel formatWith:(NSString *)formatter value:(CGFloat)value{
  int seconds = (int)value % 60;
  int minutes = ((int)value / 60) % 60;
  int hours = value / 3600;
  return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
