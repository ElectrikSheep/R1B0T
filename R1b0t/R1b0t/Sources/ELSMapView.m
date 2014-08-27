//
//  ELSMapView.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSMapView.h"

@implementation ELSMapView



-(id) initWithXib {
    self = [super init];
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"mapView" owner:self options:nil];
    [self setAlpha:.3];
    return [subviewArray objectAtIndex:0];
    
    
    return self;
}

-(void) initMapWithAddressWith:(NSString*) address {
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
