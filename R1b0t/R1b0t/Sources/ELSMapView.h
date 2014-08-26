//
//  ELSMapView.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ELSMapView : UIView
@property (strong, nonatomic) IBOutlet MKMapView *mapKit;

-(id) initWithXib ;

@end
