//
//  BNRItemsViewController.m
//  
//
//  Created by Douglas Voss on 4/15/15.
//
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController () <UITableViewDataSource>

@end

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return ([[[BNRItemStore sharedStore] allItems] count] + 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                               reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                  forIndexPath:indexPath];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    NSLog(@"[items count] == %d", [items count]);
    BNRItem *item;
    if (indexPath.row < [items count])
    {
        item = items[indexPath.row];
        cell.textLabel.text = [item description];
    } else {
        item = nil;
        cell.textLabel.text = @"No more items!";
    }
    

    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
