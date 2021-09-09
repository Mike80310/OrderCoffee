//
//  AddOrderViewController.m
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/9/2.
//

#import "AddOrderViewController.h"
#import "AddCoffeeOrderViewModel.h"

@interface AddOrderViewController ()

@property (nonatomic, strong) AddCoffeeOrderViewModel *addCoffeeVM;
@property (nonatomic, strong) UISegmentedControl *coffeeSizesSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *coffeeTableView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@end

@implementation AddOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
}

- (void)setUpUI {
    
    self.addCoffeeVM = [[AddCoffeeOrderViewModel alloc] init];
    
    _coffeeSizesSegmentedControl = [[UISegmentedControl alloc] initWithItems:self.addCoffeeVM.coffeeSizes];
    _coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false;
    [_coffeeSizesSegmentedControl setSelectedSegmentIndex:0];
    
    CGRect frame = CGRectMake(20, 500, 200, 50);
    [_coffeeSizesSegmentedControl setFrame:frame];
    [self.view addSubview:_coffeeSizesSegmentedControl];
    
    [_coffeeSizesSegmentedControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [_coffeeSizesSegmentedControl.topAnchor constraintEqualToAnchor:self.coffeeTableView.bottomAnchor constant:20].active = YES;
    
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.addCoffeeVM.coffeeTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoffeeTypeTableViewCell"];
    
    if (!cell) {
        assert(false);
    }
        
    cell.textLabel.text = self.addCoffeeVM.coffeeTypes[indexPath.row];
    
    return cell;
}

- (IBAction)close:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(),^{
        [self.delegate addCoffeeOrderViewControllerDidClose:self];
    });
    
}

- (IBAction)save:(id)sender {
    
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    
    NSString *selectedSize = [_coffeeSizesSegmentedControl titleForSegmentAtIndex:_coffeeSizesSegmentedControl.selectedSegmentIndex];
    
    NSIndexPath *indexPath = self.coffeeTableView.indexPathForSelectedRow;
    
    NSString *selectedType = self.addCoffeeVM.coffeeTypes[indexPath.row];
    
    self.addCoffeeVM.name = name;
    self.addCoffeeVM.email = email;
    self.addCoffeeVM.selectedSize = selectedSize;
    self.addCoffeeVM.selectedType = selectedType;
    
    NSLog(@"name = %@, email = %@, selectedSize = %@, selectedType = %@", name, email, selectedSize, selectedType);
    
    __weak AddOrderViewController *weakSelf = self;
    [self.addCoffeeVM addOrderViewModel:^(Order * _Nonnull order) {
            
        dispatch_async(dispatch_get_main_queue(),^{
            
            [weakSelf.delegate addCoffeeOrderViewControllerDidSav:order ViewController:weakSelf];
        });
        
    } error:^(NSError * _Nonnull error) {
        
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
