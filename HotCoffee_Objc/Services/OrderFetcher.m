//
//  OrderFetcher.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//

#import "OrderFetcher.h"



@interface OrderFetcher()

@property (nonatomic, strong) id<OrderParserProtocol> parser;
@property (nonatomic, strong) id<NetworkServiceProtocol> networkClient;
@property Operation operation;

@end

@implementation OrderFetcher

- (instancetype)initWithClient:(Operation)operation Client:(nonnull id<NetworkServiceProtocol>)client Parser:(id<OrderParserProtocol>)parser{
    
    self = [super init];
    if (self) {
        self.parser = parser;
        self.networkClient = client;
        self.operation = operation;
    }
    
    return self;
}

- (void)fetchAllOrdersWithSuccess:(void (^)(NSArray<Order *> *))successCompletion Error:(void (^)(NSError *))errorCompletion {
    
    NSURL *url = [NSURL URLWithString:@"https://guarded-retreat-82533.herokuapp.com/orders"];
    
    __weak OrderFetcher * weakSelf = self;
    void (^networksResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseOrders:data WithSuccess:successCompletion Error:errorCompletion];
    };
    
    void (^addOrderNetworksResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseAddOrder:data WithSuccess:successCompletion Error:errorCompletion];
    };
    
    // TODO: improve error handling at each steps
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        switch (self.operation) {
            case OrderFetch:
                [weakSelf.networkClient getURL:url WithSuccess:networksResponse Error:errorCompletion];
                break;
                
            case OrderCreate:
                [weakSelf.networkClient getURL:url JsonData:self.jsonData HttpMethod:POST WithSuccess:addOrderNetworksResponse Error:errorCompletion];
                break;
                
            default:
                break;
        }

    });
}

@end
