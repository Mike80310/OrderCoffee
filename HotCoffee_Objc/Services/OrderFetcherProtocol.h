//
//  OrderFetcherProtocol.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//
#import <Foundation/Foundation.h>

#ifndef OrderFetcherProtocol_h
#define OrderFetcherProtocol_h

#import "Order.h"

@protocol OrderFetcherProtocol <NSObject>

- (void)fetchAllOrdersWithSuccess:(void (^)(NSArray<Order *> *))successCompletion Error:(void (^)(NSError *))errorCompletion;


@optional

@property (nonatomic, readwrite, strong) NSData *jsonData;

@end

#endif /* OrderFetcherProtocol_h */
