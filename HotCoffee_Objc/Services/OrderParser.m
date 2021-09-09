//
//  OrderParser.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/1.
//

#import "OrderParser.h"

@implementation OrderParser

- (void)parseOrders:(NSData *)data WithSuccess:(void (^)(NSArray<Order *> *))successCompletion Error:(void (^)(NSError *))errorCompletion {
    
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonArray || error) {
        // TODO: handle error better way
        errorCompletion(error);
        return;
    }
    
    if (!jsonArray) {
        // TODO: handle error
        NSError * error = [NSError errorWithDomain:NSCocoaErrorDomain code:999 userInfo:nil];
        errorCompletion(error);
        return;
    }
    
    NSMutableArray<Order *> *result = [[NSMutableArray alloc] init];
    for (NSDictionary *orderData in jsonArray) {
        
        // TODO: test fields
        NSString *name = [orderData objectForKey:@"name"];
        NSString *email = [orderData objectForKey:@"email"];
        NSString *type = [orderData objectForKey:@"type"];
        NSString *size = [orderData objectForKey:@"size"];
        
        Order *order = [[Order alloc] initWithName:name Email:email CoffeeType:type CoffeeSize:size];
        [result addObject:order];

    }
    
    successCompletion(result);
}

- (void)parseAddOrder:(NSData *)data WithSuccess:(void (^)(NSArray<Order *> *))successCompletion Error:(void (^)(NSError *))errorCompletion {
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (!dictionary || error) {
        // TODO: handle error better way
        errorCompletion(error);
        return;
    }
    
    if (!dictionary) {
        // TODO: handle error
        NSError * error = [NSError errorWithDomain:NSCocoaErrorDomain code:999 userInfo:nil];
        errorCompletion(error);
        return;
    }
    
    NSMutableArray<Order *> *result = [[NSMutableArray alloc] init];

    NSString *name = [dictionary objectForKey:@"name"];
    NSString *email = [dictionary objectForKey:@"email"];
    NSString *type = [dictionary objectForKey:@"type"];
    NSString *size = [dictionary objectForKey:@"size"];
    
    Order *order = [[Order alloc] initWithName:name Email:email CoffeeType:type CoffeeSize:size];
    [result addObject:order];
    
    successCompletion(result);
}

- (NSData *)jsonEncoderOrder:(Order *)order {
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:order.name, @"name", order.email, @"email", order.coffeeType, @"type", order.coffeeSize, @"size", nil];
    
    if([NSJSONSerialization isValidJSONObject:dictionary]) {
        NSError* error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error];
        return data;
    }
    
    NSLog(@"An error happened while serializing the JSON data.");
    return nil;
}

@end
