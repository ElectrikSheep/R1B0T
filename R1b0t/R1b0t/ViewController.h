//
//  ViewController.h
//  R1b0t
//
//  Created by L on 2014-08-25.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>

// To get the managedObjectContext
#import "AppDelegate.h"

// The Core Data entity
#import "RibotMember.h"

// The view cells
#import "ELSCollectionViewCell.h"

// To send data to the next View Controller
#import "ELSDetailViewController.h"

@interface ViewController : UIViewController 

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end

