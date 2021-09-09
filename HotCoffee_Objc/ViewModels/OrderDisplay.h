//
//  OrderDisplay.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//

#import <Foundation/Foundation.h>
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDisplay : NSObject

@property (strong, readonly, nullable) NSString* name;
@property (strong, readonly, nullable) NSString* email;
@property (strong, readonly, nullable) NSString* type;
@property (strong, readonly, nullable) NSString* size;

- (instancetype)initWithOrder:(nonnull Order*)order;

@end

NS_ASSUME_NONNULL_END
