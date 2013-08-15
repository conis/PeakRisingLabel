//
//  ViewController.h
//  Samples
//
//  Created by conis on 8/15/13.
//  Copyright (c) 2013 conis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeakRisingLabel.h"

@interface ViewController : UIViewController<PeakRisingLabelDelegate>

@property (nonatomic, strong) IBOutlet PeakRisingLabel *percentLabel;
@property (nonatomic, strong) IBOutlet PeakRisingLabel *timeLabel;

@end
