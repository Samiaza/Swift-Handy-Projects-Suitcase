//
//  Coffee.m
//  quest1
//
//  Created by Gemma Emery on 1/30/24.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"

@implementation Coffee

- (id) initWithName:(NSString *)name andPrice:(float)price {
    self = [super init];
    if (self) {
        self->name = name;
        self->price = price;
    }
    return self;
}

@end
