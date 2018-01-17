//
//  CMProximitySensorDemo.h
//  CoreMotion
//
//  Created by Andreas Eichner on 04.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMProximitySensorDemo : UIViewController
{
    IBOutlet UIButton *startCountDownButton;
    IBOutlet UILabel *counterLabel;
    IBOutlet UILabel *answerLabel;
}

- (IBAction)doCountdown: (id)sender;

@end
