//
//  Order.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/8/30.
//

#import "Order.h"


@implementation Order

- (instancetype)initWithName:(NSString *)name Email:(NSString *)email CoffeeType:(NSString *)type CoffeeSize:(NSString *)size{
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.email = email;
        self.coffeeType = type;
        self.coffeeSize = size;
        
    }
    return self;
}

@end
