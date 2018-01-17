//
//  CMLocationDemo.m
//  CoreMotion
//
//  Created by Andreas Eichner on 02.09.13.
//  Copyright (c) 2013 Andreas Eichner. All rights reserved.
//

#import "CMLocationDemo.h"

@interface CMLocationDemo ()

@end

@implementation CMLocationDemo

#pragma mark Nothing to change here
- (void)updateMapLocationToLatitude:(CLLocationDegrees)lat longitude:(CLLocationDegrees)lon
{
    coordinatesLabel.text = [NSString stringWithFormat:@"lat = %.02f, lon = %.02f", lat, lon];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    point.coordinate = coord;
    [mapView addAnnotation:point];
    
    // Scroll to the desired location
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001f, 0.001f);
    [mapView setRegion:MKCoordinateRegionMake(coord, span) animated:YES];
}

-(MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseIdentifier = @"myPin";
    MKPinAnnotationView *pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    if(pin == nil)
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    pin.annotation = annotation;
    pin.pinColor = MKPinAnnotationColorGreen;
    pin.animatesDrop = YES;
    
    return pin;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error in updating the location: %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self locationManager:manager didUpdateLocations:[NSArray arrayWithObject:newLocation]];
}


#pragma mark Assignments

-(IBAction)startUserLocalization:(id)sender
{
    // TODO: 3.1
    
    // Create an instance of CLLocationManager and store it in the locationManager ivar (if nil)

    
    // Set the delegate of "locationManagter" to self

    
    // 3.1 Set the distance filter to 1 meters

    
    // 3.1 Set the desired accuracy to kCLLocationAccuracyNearestTenMeters

    
    // 3.1 Start updating the location

    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // TODO: 3.2
    
    // 3.2 Grab the latest location (last element in the array)

    
    // 3.2 save latitude and longitude from the location in local variables


    
    // 3.2 Call "updateMapLocationToLatitude:longitude:" and

    
    // 3.2 call "reverseGeocodeLocation:" on self with the obtained location

    
}

- (void)reverseGeocodeLocation:(CLLocation*)location
{
    
    
    
    // TODO: 3.3
    
    // 3.3 Cancel the running geocoding request

    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
        {
            // 3.3 Return in case of errors or empty results

         
            // 3.3 Extract any placemark from the result

         
            // 3.3 Set the "text" property of locationNameLabel to the name of placemark

            
         }
     ];
}


@end
