//
//  ELSImporter.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "RibotMember.h"
#import <UIKit/UIKit.h>

@interface ELSImporter : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


-(id) initWithContext:(NSManagedObjectContext*) context;

-(void) createRibotersEntitiesInCoreData ;
@end
