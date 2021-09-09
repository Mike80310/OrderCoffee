//
//  AddCoffeeOrderViewModel.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "AddCoffeeOrderViewModel.h"
#import "Coffee.h"
#import "OrderFetcher.h"
#import "WebService.h"
#import "OrderParser.h"

@interface AddCoffeeOrderViewModel()

@property (nonatomic, strong) id<OrderFetcherProtocol> fetcher;
@property (strong, readwrite, nullable) NSArray* coffeeTypes;
@property (strong, readwrite, nullable) NSArray* coffeeSizes;

@end


@implementation AddCoffeeOrderViewModel

- (instancetype)init {

    self = [super init];
    if (self) {
        Coffee *coffee = [[Coffee alloc] init];
        self.coffeeTypes = coffee.type;
        self.coffeeSizes = coffee.size;
        self.fetcher = [[OrderFetcher alloc] initWithClient:OrderCreate Client:[[WebService alloc] init] Parser:[[OrderParser alloc] init]];
        
    }
    return self;
}

- (void)addOrderViewModel:(void (^)(Order *order))successCompletion error:(void (^)(NSError *error))errorCompletion {
    
    NSData *data = [self jsonEncoderToData];
    if (data) {
        [self.fetcher setJsonData:data];
    }
    
    [self.fetcher fetchAllOrdersWithSuccess:^(NSArray<Order *> *orders) {
            
        if (orders.count > 0) {
            Order *order = orders[0];
            successCompletion(order);
            
        }else{
            NSError *error;
            errorCompletion(error);
        }
        
    } Error:errorCompletion];
    
}

- (NSData *)jsonEncoderToData {
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.name, @"name", self.email, @"email", self.selectedType, @"type", self.selectedSize, @"size", nil];
    
    if([NSJSONSerialization isValidJSONObject:dictionary]) {
        NSError* error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error];
        NSLog(@"Result: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        return data;
    }
    
    NSLog(@"An error happened while serializing the JSON data.");
    return nil;
}



@end
