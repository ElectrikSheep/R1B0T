//
//  ELSImporter.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSImporter.h"

@interface ELSImporter()

@end

@implementation ELSImporter

-(id) initWithContext:(NSManagedObjectContext*) context {
    self = [super init];
    self.managedObjectContext = context;
    return self ;
}


#pragma mark JSON
-(NSArray*) getArrayFromGETQuery:(NSString *)urlAddress error:(NSError**)error{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlAddress]];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    
    
    // PARSE the JSON FILE
    NSArray* Team = [NSJSONSerialization JSONObjectWithData:[requestReply dataUsingEncoding:NSUTF8StringEncoding ]
                                                    options:kNilOptions
                                                      error:error];
    return Team ;
}

-(NSDictionary*)getDictionaryFromGETQuery:(NSString *)urlAddress error:(NSError**)error{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlAddress]];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    
    
    // PARSE the JSON FILE
    NSDictionary* Team = [NSJSONSerialization JSONObjectWithData:[requestReply dataUsingEncoding:NSUTF8StringEncoding ]
                                                         options:kNilOptions
                                                           error:error];
    return Team ;
}



-(void) createRibotersEntitiesInCoreData {
    NSError *err = nil;
    NSArray* Team = [self getArrayFromGETQuery:@"https://devchallenge.ribot.io/api/team" error:&err];
    
    // Now for each member of the team we will grab
    [Team enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // Parse team members
        NSError*error = nil ;
        NSString* query = [NSString stringWithFormat:@"https://devchallenge.ribot.io/api/team/%@", [obj valueForKey:@"id"]];
        NSDictionary*member = [self getDictionaryFromGETQuery:query error:&error];
        
        //[self createNewRiboterWithDictionary:member];
        //[self createRiboterWithCheckandDictionary:member];
        
        RibotMember *new = [RibotMember itemWithParsedDictionary:member inManagedObjectContext:self.managedObjectContext];
        
        if( new ) {
            NSData*data = [self ribotarFromName:new.identifier];
            if( [UIImage imageWithData:data] == nil ) {
                data = UIImagePNGRepresentation( [UIImage imageNamed:@"img_GenericRibotar"]) ;
            }
            new.ribotar = data ;
        }
        
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }];
    
}

-(NSData*) ribotarFromName:(NSString*) identifier {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:
                     [NSString stringWithFormat:@"https://devchallenge.ribot.io/api/team/%@/ribotar", identifier]]];
    [request setHTTPMethod:@"GET"];
    NSError *error ;
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:&error];
    
    if( error != nil) {
        NSLog(@"Loading Ribotar failed with :%@", [error description]);
    }
    return requestHandler ;
}





@end
