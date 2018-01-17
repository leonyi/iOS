//
//  CMProximitySensorDemo.m
//  CoreMotion
//
//  Created by Andreas Eichner on 04.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import "CMProximitySensorDemo.h"

@interface CMProximitySensorDemo ()

#pragma mark Nothing to change here

@property (nonatomic, strong) NSTimer * countdownTimer;
@property (nonatomic, assign) NSUInteger remainingTicks;

-(void)handleTimerTick;
-(void)updateLabel;

@end

@implementation CMProximitySensorDemo

#pragma mark Nothing to change here

- (void)deviceProximityChangedTo:(BOOL)deviceIsClose
{
    NSMutableString *logMessage = [[NSMutableString alloc] initWithString:@"The Proximity state changed. The Device is now "];
    
    if(deviceIsClose)
    {
        [logMessage appendString:@"close"];
        if (0 == self.remainingTicks)
        {
            self.view.backgroundColor = [UIColor redColor];
            answerLabel.text = @"Too late... You can do better!";
            counterLabel.textColor = [UIColor blackColor];
        }
        else if (self.remainingTicks <= 50)
        {
            self.view.backgroundColor = [UIColor greenColor];
            answerLabel.text = @"Well done!";
        }
        else
        {
            self.view.backgroundColor = [UIColor redColor];
            answerLabel.text = @"Too early... You can do better!";
        }
        
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
        counterLabel.textColor = [UIColor blackColor];
    }
    else
    {
        [logMessage appendString:@"away"];
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    NSLog(@"%@", logMessage);
}

-(IBAction)doCountdown: (id)sender;
{
    if (self.countdownTimer)
        return;
    counterLabel.textColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [sender setTitle:@"Restart Count Down" forState:UIControlStateNormal];
    
    self.remainingTicks = 500;
    [self updateLabel];
    
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(handleTimerTick) userInfo: nil repeats: YES];
}

-(void)handleTimerTick;
{
    self.remainingTicks--;
    [self updateLabel];
    
    if (self.remainingTicks == 50) {
        counterLabel.textColor = [UIColor greenColor];
    }
    
    if (self.remainingTicks <= 0) {
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
        self.view.backgroundColor = [UIColor redColor];
        answerLabel.text = @"Too late... You can do better!";
        counterLabel.textColor = [UIColor blackColor];
    }
}

-(void)updateLabel;
{
    counterLabel.text = [[NSNumber numberWithUnsignedInt: self.remainingTicks] stringValue];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Assignments

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.remainingTicks = 500;
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    [device setProximityMonitoringEnabled:YES];
    
    [device addObserver:self forKeyPath:@"proximityState" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // TODO: 4.1 (Challange)
    
    // 4.1 deactivate Proximity Sensor and remove the Observer
    // HINT: Take a look at "viewWillAppear:"
    

    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // TODO: 4.2 (Challange)
    
    // 4.2 Call "deviceProximityChangedTo:" with the proximityState of the currentDevice if keyPath equals "proximityState"
    

}

@end
