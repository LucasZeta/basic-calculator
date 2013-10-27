//
//  NSObject+Singleton.m
//  BasicCalculator
//
//  Created by Lucas de Souza da Conceição on 27/10/13.
//  Copyright (c) 2013 Lucas de Souza da Conceição. All rights reserved.
//

#import "NSObject+Singleton.h"

@implementation NSObject (Singleton)

+ (id)sharedInstance
{
    static NSObject *sharedObject = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });

    return sharedObject;
}

@end
