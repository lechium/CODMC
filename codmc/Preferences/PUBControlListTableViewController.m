//
//  PUBControlListTableViewController.m
//  pubc
//
//  Created by Kevin Bradley on 6/21/19.
//  Copyright © 2019 nito llc. All rights reserved.
//

#import "PUBControlListTableViewController.h"
#import "PUBGControllerManager.h"
@interface PUBControlListTableViewController ()

@end

@implementation PUBControlListTableViewController

@synthesize currentValue, keyValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


- (NSArray *)availableOptions {
 
    return @[PGBActionTypeLeft,PGBActionTypeRight,PGBActionTypeRun,PGBActionTypeCrouch,PGBActionTypeConceal,PGBActionTypeJump,PGBActionTypeFirstWeapon,PGBActionTypeSecondWeapon,PGBActionTypeAim,PGBActionTypeReload,PGBActionFirstItemSelect,PGBActionTypeAirOne, PGBActionTypeAirTwo, PGBActionTypeAirThree];
    /*@[@"PGBActionTypeLeft",@"PGBActionTypeRight",@"PGBActionTypeRun",@"PGBActionTypeCrouch",@"PGBActionTypeConceal",@"PGBActionTypeJump",@"PGBActionTypeFirstWeapon",@"PGBActionTypeSecondWeapon",@"PGBActionTypeSmallWeapon",@"PGBActionTypeAim",@"PGBActionTypeReload",@"PGBActionTypeExitRound",@"PGBActionTypeInventory",@"PGBActionHandAction",@"PGBActionFirstItemSelect",@"PGBActionMapAction",@"PGBActionTypePeakLeft",@"PGBActionTypePeakRight"];
*/
     }

- (id)initWithOriginalValue:(id)value keyValue:(NSString *)kv {
 
    self = [super init];
    if (self){
        
        self.currentValue = value;
        self.keyValue = kv;
        
    }
    return self;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self availableOptions].count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.currentValue = self.availableOptions[indexPath.row];
    [self.tableView reloadData];
    PUBGControllerManager *shared = [PUBGControllerManager sharedManager];
    [shared updateGamplayValue:self.currentValue forKey:keyValue];
    [self.navigationController popViewControllerAnimated:true];
}
    

- (void)configureCell:(UITableViewCell *)cell forRow:(NSInteger)row {

    NSString *value = [self availableOptions][row];
    NSLog(@"value: -%@-", value);
    NSLog(@"currentValue: %@", self.currentValue);
    cell.textLabel.text = value;
    if ([value isEqualToString:currentValue]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...

    [self configureCell:cell forRow:indexPath.row];
    
    return cell;
}



@end
