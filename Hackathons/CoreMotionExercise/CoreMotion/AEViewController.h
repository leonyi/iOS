//
//  AEViewController.h
//  CoreMotion
//
//  Created by Andreas Eichner on 02.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *proximitySensorButton;
@property (weak, nonatomic) IBOutlet UIButton *deviceMotionButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

@end
