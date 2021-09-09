//
//  Order.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/8/30.
//

#import <Foundation/Foundation.h>

#define POST @"POST"
#define GET @"GET"

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* coffeeType;
@property (nonatomic, strong) NSString* coffeeSize;

- (instancetype)initWithName:(NSString *)name Email:(NSString *)email CoffeeType:(NSString *)type CoffeeSize:(NSString *)size;

@end

NS_ASSUME_NONNULL_END
