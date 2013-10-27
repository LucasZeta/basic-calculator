//
//  LZOperation.h
//  BasicCalculator
//
//  Created by Lucas de Souza da Conceição on 26/10/13.
//  Copyright (c) 2013 Lucas de Souza da Conceição. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LZOperation <NSObject>

- (double)doTheMathWith:(double)number1 and:(double)number2;

@end
