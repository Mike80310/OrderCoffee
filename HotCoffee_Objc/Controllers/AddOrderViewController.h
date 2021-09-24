//
//  AddOrderViewController.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import <UIKit/UIKit.h>
#import "Order.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddCoffeeOrderDelegate

- (void)addCoffeeOrderViewControllerDidSav:(Order *)order ViewController:(UIViewController *)controller;

- (void)addCoffeeOrderViewControllerDidClose:(UIViewController *)controller;

@end

@interface AddOrderViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> 

@property (weak, nonatomic) id <AddCoffeeOrderDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
