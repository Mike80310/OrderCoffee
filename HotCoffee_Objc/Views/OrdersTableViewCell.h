//
//  OrdersTableViewCell.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class OrderDisplay;
@interface OrdersTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *DetailLabel;

- (void)setDisplay:(nullable OrderDisplay *)display;

@end

NS_ASSUME_NONNULL_END
