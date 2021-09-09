//
//  Coffee.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "Coffee.h"

@implementation Coffee

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.type = [[NSArray alloc] initWithObjects:@"cappuccino", @"latte", @"espressino", @"cortado",  nil];
        self.size = [[NSArray alloc] initWithObjects:@"small", @"medium", @"large", nil];
        
    }
    return self;
}

@end
