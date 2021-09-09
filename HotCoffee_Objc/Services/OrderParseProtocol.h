//
//  OrderParseProtocol.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//
#import <Foundation/Foundation.h>

#ifndef OrderParseProtocol_h
#define OrderParseProtocol_h

#import "Order.h"

@protocol OrderParserProtocol <NSObject>

- (void)parseOrders:(NSData *)data WithSuccess:(void (^)(NSArray<Order *> *orders))successCompletion Error:(void (^)(NSError *error))errorCompletion;

- (void)parseAddOrder:(NSData *)data WithSuccess:(void (^)(NSArray<Order *> *))successCompletion Error:(void (^)(NSError *))errorCompletion;

@end

#endif /* OrderParseProtocol_h */
