//
//  Card.h
//  CardsOBC36
//
//  Created by Owen Gaudio on 9/29/20.
//  Copyright © 2020 Owen Gaudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initCard:(NSString *)suit
             imageString:(NSString *)image;


- (instancetype)initDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
