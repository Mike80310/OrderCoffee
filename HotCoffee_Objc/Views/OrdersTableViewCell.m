//
//  OrdersTableViewCell.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "OrdersTableViewCell.h"
#import "OrderDisplay.h"

@implementation OrdersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDisplay:(OrderDisplay *)display {
    
    [self.titleLabel setText:display.type];
    [self.DetailLabel setText:display.size];
}

@end
