//
//  CMCameraDemo.h
//  CoreMotion
//
//  Created by Andreas Eichner on 02.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMCameraDemo : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UIImageView *imageView;
    UIImagePickerController *picker;
}

- (IBAction)takePicture:(id)sender;

@end