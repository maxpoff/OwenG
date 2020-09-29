//
//  CardController.h
//  CardsOBC36
//
//  Created by Owen Gaudio on 9/29/20.
//  Copyright © 2020 Owen Gaudio. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;
#import <UIKit/UIKit.h>



@interface CardController : NSObject

+ (void)drawANewCard:(NSInteger )numberOfCards completion:(void(^) (NSArray<Card *> *cards, NSError *error))completion;

+ (void)fetchImage:(Card *)card completion:(void(^) (UIImage *image))completion;

@end

