//
//  Barista.h
//  quest1
//
//  Created by Gemma Emery on 1/30/24.
//

#ifndef Barista_h
#define Barista_h

#import "Coffee.h"
#import "IBarista.h"

@interface Barista : NSObject <IBarista>
{
    NSString * name;
    NSString * lastname;
    int experience;
}
- (id) initWithName: (NSString*) name andLastname: (NSString*) lastname andExperience: (int) experience;

@end

#endif /* Barista_h */
