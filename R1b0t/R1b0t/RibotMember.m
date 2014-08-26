//
//  RibotMember.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "RibotMember.h"


@implementation RibotMember

@dynamic email;
@dynamic favSeason;
@dynamic favTweet;
@dynamic firstName;
@dynamic hexColor;
@dynamic identifier;
@dynamic lastName;
@dynamic location;
@dynamic nickName;
@dynamic rDescription;
@dynamic ribotar;
@dynamic role;
@dynamic twitter;

+ (RibotMember *)itemWithParsedDictionary:(NSDictionary *)parsedItem inManagedObjectContext:(NSManagedObjectContext *)context
{
    RibotMember *item;
    if (parsedItem) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"RibotMember"];
        request.predicate = [NSPredicate predicateWithFormat:@"identifier = %@", parsedItem[@"id"]];
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || [matches count] > 1) {
            NSLog(@"Multiple copies of unique item detected in the document");
        } else if (![matches count]){
            item = [NSEntityDescription insertNewObjectForEntityForName:@"RibotMember"
                                                 inManagedObjectContext:context];
            
            item.identifier = parsedItem[@"id"];
            item.firstName = parsedItem[@"firstName"];
            item.lastName = parsedItem[@"lastName"];
            item.nickName = parsedItem[@"nickname"];
            item.location = parsedItem[@"location"];
            item.role = parsedItem[@"role"];
            item.hexColor = parsedItem[@"hexColor"];
            item.twitter = parsedItem[@"twitter"];
            item.email = parsedItem[@"email"];
            item.favTweet = parsedItem[@"favSweet"];
            item.favSeason = parsedItem[@"favSeason"];
            item.rDescription = parsedItem[@"description"];
            item.ribotar = nil;
        } else {
            item = [matches lastObject];
        }
    }
    return item;
}


@end
