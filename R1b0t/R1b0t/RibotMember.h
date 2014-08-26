//
//  RibotMember.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RibotMember : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * favSeason;
@property (nonatomic, retain) NSString * favTweet;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * hexColor;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * rDescription;
@property (nonatomic, retain) NSData * ribotar;
@property (nonatomic, retain) NSString * role;
@property (nonatomic, retain) NSString * twitter;

+ (RibotMember *)itemWithParsedDictionary:(NSDictionary *)parsedItem inManagedObjectContext:(NSManagedObjectContext *)context ;

@end
