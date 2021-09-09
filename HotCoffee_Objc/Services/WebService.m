//
//  WebService.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/8/30.
//

#import "WebService.h"

@interface WebService()

@property (nonatomic, strong) NSMutableDictionary * tasks;

@end


@implementation WebService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tasks = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)getURL:(NSURL *)url WithSuccess:(void (^)(NSData *))successCompletion Error:(void (^)(NSError *))errorCompletion {
    
    NSURLSessionTask * previousTask = [self.tasks objectForKey:url.absoluteString];
    if (previousTask){
        [previousTask cancel];
    }
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSMutableURLRequest *mutRequest = [NSMutableURLRequest requestWithURL:url];
    [mutRequest setHTTPMethod:@"GET"];
    [mutRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionTask * task = [session dataTaskWithRequest:mutRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            errorCompletion(error);
            return;
        }
        
        if (!data) {
            // TODO create error
            errorCompletion(nil);
            return;
        }
        
        successCompletion(data);
    }];
    
    [task resume];
    [self.tasks setObject:task forKey:url.absoluteString];
}

- (void)getURL:(NSURL *)url JsonData:(NSData *)data HttpMethod:(NSString *)httpMethod WithSuccess:(void (^)(NSData *))successCompletion Error:(void (^)(NSError *))errorCompletion {
    
    NSURLSessionTask * previousTask = [self.tasks objectForKey:url.absoluteString];
    if (previousTask){
        [previousTask cancel];
    }
    
    NSURLSession * session = [NSURLSession sharedSession];

    NSMutableURLRequest *mutRequest = [NSMutableURLRequest requestWithURL:url];
    [mutRequest setHTTPMethod:httpMethod];
    [mutRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [mutRequest setHTTPBody:data];
    
    NSURLSessionTask * task = [session dataTaskWithRequest:mutRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            errorCompletion(error);
            return;
        }
        
        if (!data) {
            // TODO create error
            errorCompletion(nil);
            return;
        }
        
        successCompletion(data);
    }];
    
    [task resume];
    [self.tasks setObject:task forKey:url.absoluteString];
}


@end
