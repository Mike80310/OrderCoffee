//
//  NetworkServiceProtocol.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/8/30.
//
#import <Foundation/Foundation.h>
#ifndef NetworkServiceProtocol_h
#define NetworkServiceProtocol_h

@protocol NetworkServiceProtocol <NSObject>

- (void)getURL:(NSURL*)url WithSuccess:(void (^)(NSData *response))successCompletion Error:(void (^)(NSError *error))errorCompletion;
- (void)getURL:(NSURL *)url JsonData:(NSData *)data HttpMethod:(NSString *)httpMethod WithSuccess:(void (^)(NSData *))successCompletion Error:(void (^)(NSError *))errorCompletion;

@end

#endif /* NetworkServiceProtocol_h */
