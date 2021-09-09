//
//  OrdersTableViewController.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "OrdersTableViewController.h"
#import "WebService.h"
#import "OrderDisplay.h"
#import "OrderListViewModel.h"
#import "OrdersTableViewCell.h"


@interface OrdersTableViewController ()

@property (nonatomic, strong) OrderListViewModel *orderListViewModel;

@end

@implementation OrdersTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.orderListViewModel = [[OrderListViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateOrder];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Delegate functions of AddOrderViewController
- (void)addCoffeeOrderViewControllerDidSav:(Order *)order ViewController:(UIViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];

    [self.orderListViewModel addNewOrder:order];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

- (void)addCoffeeOrderViewControllerDidClose:(UIViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}


- (void)populateOrder {
    __weak OrdersTableViewController *weakSelf = self;
    [self.orderListViewModel ordersViewModel:^(NSArray<OrderDisplay *> * _Nonnull ordersDisplay) {
            
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
        
    } error:^(NSError * _Nonnull error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.orderListViewModel.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.orderListViewModel.numberOfItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrdersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell"];
    
    if (!cell) {
        assert(false);
    }
    
    // Configure the cell...
    [cell setDisplay:[self.orderListViewModel orderViewModel:indexPath]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddCoffeeOrderSegue"]) {
        AddOrderViewController *addCoffeeOrderVC = segue.destinationViewController.childViewControllers.firstObject;
        [addCoffeeOrderVC setDelegate:self];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
