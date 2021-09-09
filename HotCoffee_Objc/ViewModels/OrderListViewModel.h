//
//  OrderListViewModel.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import <Foundation/Foundation.h>
#import "OrderDisplay.h"
#import <UIKit/UIKit.h>
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderListViewModel : NSObject

- (void)ordersViewModel:(void (^)(NSArray<OrderDisplay*>*ordersDisplay))successCompletion error:(void (^)(NSError *error))errorCompletion;

- (nullable OrderDisplay *)orderViewModel:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfItems;
- (NSUInteger)numberOfSections;
- (void)addNewOrder:(Order *)newOrder;

@end

NS_ASSUME_NONNULL_END
