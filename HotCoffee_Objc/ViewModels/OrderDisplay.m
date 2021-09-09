//
//  OrderDisplay.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//

#import "OrderDisplay.h"

@interface OrderDisplay()

@property (nonatomic, readwrite, nullable) NSString* name;
@property (nonatomic, readwrite, nullable) NSString* email;
@property (nonatomic, readwrite, nullable) NSString* type;
@property (nonatomic, readwrite, nullable) NSString* size;

@end

@implementation OrderDisplay

- (instancetype)initWithOrder:(Order*)order{
    
    self = [super init];
    
    if (self) {
        self.name = order.name;
        self.email = order.email;
        self.type = order.coffeeType;
        self.size = order.coffeeSize;
    }
    
    return self;
}

@end
