//
//  Barista.m
//  quest1
//
//  Created by Gemma Emery on 1/30/24.
//

#import <Foundation/Foundation.h>
#import "Barista.h"

@implementation Barista

- (id) initWithName:(NSString *)name andLastname:(NSString *)lastname andExperience:(int)experience {
    self = [super init];
    if (self) {
        self->name = name;
        self->lastname = lastname;
        self->experience = experience;
    }
    return self;
}

 - (Coffee*) brew:(Coffee *) order
{
    printf("Proccesing brewing coffee...\n");
    return order;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"Man: %@ %@, experiense: %i years", self->name, self->lastname, self->experience];
}

@end
