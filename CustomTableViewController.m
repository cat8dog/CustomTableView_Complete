#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"

//@interface CustomTableViewController ()
//
//
//@end

@implementation CustomTableViewController
{
    NSMutableArray *recipeNames;
    NSArray *recipeImages;
    NSArray *prepTimes;
    BOOL recipeChecked[16];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    recipeNames = [dict objectForKey:@"Name"];
    recipeImages = [dict objectForKey:@"Image"];
    prepTimes = [dict objectForKey:@"PrepTime"];
    
}


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipeNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"Cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView
                                                        dequeueReusableCellWithIdentifier:cellIdentifier];

    cell.nameLabel.text = [recipeNames objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTimes objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if (recipeChecked[indexPath.row])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString* selectedRecipe = [recipeNames objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:selectedRecipe
                                 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

    //Display Alert Message
    
    if (recipeChecked[indexPath.row]){
        recipeChecked[indexPath.row] = NO;
    }else{
        [messageAlert show];
        recipeChecked[indexPath.row] = YES;
    }
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
{
    [recipeNames removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //no fade :(
}

@end
