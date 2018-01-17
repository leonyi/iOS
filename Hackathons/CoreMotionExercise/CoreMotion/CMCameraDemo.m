//
//  CMCameraDemo.m
//  CoreMotion
//
//  Created by Andreas Eichner on 02.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import "CMCameraDemo.h"
@import MobileCoreServices;

@interface CMCameraDemo ()

@end

@implementation CMCameraDemo

#pragma mark Assignments

-(IBAction)takePicture:(id)sender
{
    // TODO: 1.1
    
    // 1.1 Alloc and init UIImagePickerController and store it in the ivar "picker" (if picker was nil)
    
    
    // 1.1 Set the "picker"s delegate to self
    
    
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        NSLog(@"No camera available.");
        // 1.1 Set the source type to UIImagePickerControllerSourceTypePhotoLibrary
        
        
    }
    else
    {
        // 1.1 Set the source type to UIImagePickerControllerSourceTypeCamera
        
    }

    // 1.1 Call "presentViewController:animated:YES:completion:nil" on self
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if([mediaType isEqualToString:(NSString*)kUTTypeImage]){
        
        // TODO: 1.2
        
        // 1.2 Get an image from info dictionary (key = UIImagePickerControllerOriginalImage) and save it in a variable
        
        
        // 1.2 Set imageView.image to the previously saved image
        
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
