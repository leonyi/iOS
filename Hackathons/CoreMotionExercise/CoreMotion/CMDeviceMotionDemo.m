//
//  CMDeviceMotionDemo.m
//  CoreMotion
//
//  Created by Andreas Eichner on 05.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import "CMDeviceMotionDemo.h"
@import CoreMotion;

@interface CMDeviceMotionDemo ()
@property (nonatomic, strong) CMMotionManager * motionManager;
@property (nonatomic, strong) UIView * ball;
@end

@implementation CMDeviceMotionDemo

#pragma mark Nothing to change here

float X = 0;
float Y = 0;
float R = 40;

- (void)initBall
{
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(160, 250, R, R)];
    self.ball.layer.cornerRadius = 20;
    self.ball.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.ball];
}

- (void)updateBallWithRoll:(float)roll Pitch:(float)pitch Yaw:(float)yaw accX:(float)accX accY:(float)accY accZ:(float)accZ
{
    X += 2 * roll;
    Y += 2 * pitch;
    
    X *= 0.8;
    Y *= 0.8;
    
    CGFloat newX = self.ball.frame.origin.x + X;
    CGFloat newY = self.ball.frame.origin.y + Y;
    
    newX = fmin(280, fmax(0, newX));
    newY = fmin(527, fmax(64, newY));
    
    CGFloat newR = R + 10 * accZ;
    
    self.ball.frame = CGRectMake(newX, newY, newR, newR);
}

#pragma mark Assignments

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initBall];
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateDeviceMotion) userInfo:nil repeats:YES];
    
    // TODO: 2.1
    
    // 2.1 Create a CMMotionManager instance and store it in the property "motionManager"
    
    
    // 2.1 Set the motion update interval to 1/60
    
    
    // 2.1 Start updating the motion using the reference frame CMAttitudeReferenceFrameXArbitraryCorrectedZVertical
    
    
    
}

-(void)updateDeviceMotion
{
    // TODO: 2.2
    
    // 2.2 Get the deviceMotion from motionManager
    
    
    // 2.2 Return if the returned CMDeviceMotion object is nil
    
    
    // 2.2 Get the attitude from CMDeviceMotion
    
    
    // 2.2 Get the userAcceleration from CMDeviceMotion
    
    
    // 2.2 Call "updateBallWithRoll:Pitch:Yaw:accX:accY:accZ:" on self with the appropriate arguments
    
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if(self.motionManager != nil){
        
        // TODO: 2.3
        
        // 2.3 Stop updating the motionManager
        
        
        // 2.3 Set the ivar "motionManager" to nil
        
        
    }
}


@end
