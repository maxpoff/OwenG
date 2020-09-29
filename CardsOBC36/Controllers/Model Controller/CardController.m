//
//  CardController.m
//  CardsOBC36
//
//  Created by Owen Gaudio on 9/29/20.
//  Copyright © 2020 Owen Gaudio. All rights reserved.
//

#import "CardController.h"
#import "Card.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawEndpoint = @"draw/";
static NSString * const countEndpoint = @"count";

@implementation CardController

+ (void)drawANewCard:(NSInteger )numberOfCards completion:(void (^)(NSArray<Card *> *, NSError *))completion{
    //setting up url
    NSURL* baseURL = [NSURL URLWithString:baseURLString];
    NSURL * drawURL = [baseURL URLByAppendingPathComponent:drawEndpoint];
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    //how to add a query
    NSURLComponents *components = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:countEndpoint value:cardCount];
    components.queryItems = @[query];
    
    //final URL
    NSURL *finalURL = components.URL;
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil,error);
        }
        
        if (!data)
        {
            NSLog(@"Error: no data");
            completion(nil,error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error: &error];
    
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Can't create dictionary");
            completion(nil,error);
            return;
        }
        
        NSArray * cards = jsonDictionary[@"cards"];
        NSMutableArray *placeholderCards = [NSMutableArray array];
        
        for(NSDictionary * cardDictionary in cards){
            Card * card = [[Card alloc] initDict: cardDictionary];
            [placeholderCards addObject: card];
        }
        
        completion(placeholderCards,nil);
    }]resume];
    
}

+ (void)fetchImage:(Card *)card completion:(void (^)(UIImage *))completion{
    NSURL *imageURL = [NSURL URLWithString:card.image];

    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error){
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }

        if (!data){
            NSLog(@"Error: no data");
            completion(nil);
            return;
        }

        UIImage *image = [UIImage imageWithData:data];
        completion(image);
   
    }]resume];
}

@end
