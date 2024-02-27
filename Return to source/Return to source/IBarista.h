//
//  IBarista.h
//  quest2
//
//  Created by Gemma Emery on 1/31/24.
//

#ifndef IBarista_h
#define IBarista_h

@protocol IBarista

@required
- (Coffee*) brew: (Coffee*) order;
- (NSString *) description;
@end

#endif /* IBarista_h */
