//
//  ELSCollectionViewCell.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSCollectionViewCell.h"
#import "UIColor+ColorConverter.h"

@implementation ELSCollectionViewCell

-(void) initCellWith:(NSString*)name andImage:(UIImage*)ribotar {
    self.riboterName.text = name ;
    self.riboterRibotar.image = ribotar ;
}

-(void) alterBGColorWith:(NSString*) color {
    // Handling the lack of HexColor
    if( color != nil ){
        self.backgroundColor = [UIColor colorWithHexString:color] ;
    }
    else  self.backgroundColor = [UIColor grayColor];
}
@end
