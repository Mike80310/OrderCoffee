//
//  OrderListViewModel.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "OrderListViewModel.h"
#import "OrderFetcher.h"
#import "WebService.h"
#import "OrderParser.h"


@interface OrderListViewModel()

@property (nonatomic, strong) id<OrderFetcherProtocol> fetcher;
@property (nonatomic, strong) NSMutableArray<OrderDisplay *> *orders;

@end

@implementation OrderListViewModel

- (instancetype)init {
    self = [super self];
    if (self) {
        self.orders = [[NSMutableArray alloc] init];
        self.fetcher = [[OrderFetcher alloc] initWithClient:OrderFetch Client:[[WebService alloc] init] Parser:[[OrderParser alloc] init]];
    }
    return self;
}

- (void)ordersViewModel:(void (^)(NSArray<OrderDisplay*>*ordersDisplay))successCompletion error:(void (^)(NSError *error))errorCompletion {
    
    __weak OrderListViewModel *weakSelf = self;
    [self.fetcher fetchAllOrdersWithSuccess:^(NSArray<Order *> *orders) {
            
        NSMutableArray *orderDisplayArray = [[NSMutableArray alloc] init];
        for (Order *order in orders) {
            [orderDisplayArray addObject:[[OrderDisplay alloc] initWithOrder:order]];
        }
        
        [weakSelf setOrders:orderDisplayArray];
        successCompletion(orderDisplayArray);
        
    } Error:errorCompletion];
    
}

- (OrderDisplay *)orderViewModel:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.orders.count) {
        return nil;
    }
    return  self.orders[indexPath.row];
}

- (void)addNewOrder:(Order *)newOrder {
    
    [self.orders addObject:[[OrderDisplay alloc] initWithOrder:newOrder]];
}

- (NSUInteger)numberOfItems {
    return self.orders.count;
}

- (NSUInteger)numberOfSections {
    return 1;
}



@end
