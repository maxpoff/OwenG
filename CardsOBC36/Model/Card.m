//
//  Card.m
//  CardsOBC36
//
//  Created by Owen Gaudio on 9/29/20.
//  Copyright © 2020 Owen Gaudio. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initCard:(NSString *)suit imageString:(NSString *)image{
    if (self = [super init]){
        _suit = suit;
        _image = image;
    }
    return self;
}

-(instancetype)initDict:(NSDictionary *)dictionary{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return[self initCard:suit imageString:image];
}

@end
