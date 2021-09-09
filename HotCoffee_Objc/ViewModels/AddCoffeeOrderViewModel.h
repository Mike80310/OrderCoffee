//
//  AddCoffeeOrderViewModel.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import <Foundation/Foundation.h>
#import "Order.h"
//#import "OrderFetcher.h"
//#import "WebService.h"
//#import "OrderParser.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddCoffeeOrderViewModel : NSObject

@property (strong, readonly, nullable) NSArray* coffeeTypes;
@property (strong, readonly, nullable) NSArray* coffeeSizes;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* selectedType;
@property (nonatomic, strong) NSString* selectedSize;

- (void)addOrderViewModel:(void (^)(Order *order))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

NS_ASSUME_NONNULL_END
