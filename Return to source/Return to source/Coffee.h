//
//  Coffee.h
//  quest1
//
//  Created by Gemma Emery on 1/30/24.
//

#import <Foundation/Foundation.h>

#ifndef Coffee_h
#define Coffee_h

@interface Coffee : NSObject
{
@public
    NSString * name;
    float price;
}
- (id) initWithName : (NSString*) name andPrice: (float) price;
@end

#endif /* Coffee_h */
