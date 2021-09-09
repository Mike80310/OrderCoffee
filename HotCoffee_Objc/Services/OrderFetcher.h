//
//  OrderFetcher.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//

#import <Foundation/Foundation.h>
#import "OrderFetcherProtocol.h"
#import "OrderParseProtocol.h"
#import "NetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    OrderFetch,
    OrderCreate
} Operation;

@interface OrderFetcher : NSObject <OrderFetcherProtocol>

- (instancetype)initWithClient:(Operation)operation Client:(nonnull id<NetworkServiceProtocol>)client Parser:(id<OrderParserProtocol>)parser;

@property (nonatomic, readwrite, strong) NSData *jsonData;

@end

NS_ASSUME_NONNULL_END
