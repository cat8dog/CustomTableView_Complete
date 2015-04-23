#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"
#import "Recipe.h"


@implementation CustomTableViewController

{
    NSMutableArray *recipes;
    BOOL recipeChecked[16];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
        // Initialize the recipes array
        Recipe *recipe1 = [Recipe new];
        
        recipe1.name = @"Egg Benedict";
        recipe1.prepTime = @"30 min";
        recipe1.image = @"egg_benedict.jpg";
        
        Recipe *recipe2 = [Recipe new];
        recipe2.name = @"Mushroom Risotto";
        recipe2.prepTime = @"30 min";
        recipe2.image = @"mushroom_risotto.jpg";
        
        Recipe *recipe3 = [Recipe new];
        recipe3.name = @"Full Breakfast";
        recipe3.prepTime = @"20 min";
        recipe3.image = @"full_breakfast.jpg";
        
        Recipe *recipe4 = [Recipe new];
        recipe4.name = @"Hamburger";
        recipe4.prepTime = @"30 min";
        recipe4.image = @"hamburger.jpg";
        
        Recipe *recipe5 = [Recipe new];
        recipe5.name = @"Ham and Egg Sandwich";
        recipe5.prepTime = @"10 min";
        recipe5.image = @"ham_and_egg_sandwich.jpg";
        
        Recipe *recipe6 = [Recipe new];
        recipe6.name = @"Creme Brelee";
        recipe6.prepTime = @"1 hour";
        recipe6.image = @"creme_brelee.jpg";
        
        Recipe *recipe7 = [Recipe new];
        recipe7.name = @"White Chocolate Donut";
        recipe7.prepTime = @"45 min";
        recipe7.image = @"white_chocolate_donut.jpg";
        
        Recipe *recipe8 = [Recipe new];
        recipe8.name = @"Starbucks Coffee";
        recipe8.prepTime = @"5 min";
        recipe8.image = @"starbucks_coffee.jpg";
        
        Recipe *recipe9 = [Recipe new];
        recipe9.name = @"Vegetable Curry";
        recipe9.prepTime = @"30 min";
        recipe9.image = @"vegetable_curry.jpg";
        
        Recipe *recipe10 = [Recipe new];
        recipe10.name = @"Instant Noodle with Egg";
        recipe10.prepTime = @"8 min";
        recipe10.image = @"instant_noodle_with_egg.jpg";
        
        Recipe *recipe11 = [Recipe new];
        recipe11.name = @"Noodle with BBQ Pork";
        recipe11.prepTime = @"20 min";
        recipe11.image = @"noodle_with_bbq_pork.jpg";
        
        Recipe *recipe12 = [Recipe new];
        recipe12.name = @"Japanese Noodle with Pork";
        recipe12.prepTime = @"20 min";
        recipe12.image = @"japanese_noodle_with_pork.jpg";
        
        Recipe *recipe13 = [Recipe new];
        recipe13.name = @"Green Tea";
        recipe13.prepTime = @"5 min";
        recipe13.image = @"green_tea.jpg";
        
        Recipe *recipe14 = [Recipe new];
        recipe14.name = @"Thai Shrimp Cake";
        recipe14.prepTime = @"1.5 hours";
        recipe14.image = @"thai_shrimp_cake.jpg";
        
        Recipe *recipe15 = [Recipe new];
        recipe15.name = @"Angry Birds Cake";
        recipe15.prepTime = @"4 hours";
        recipe15.image = @"angry_birds_cake.jpg";
        
        Recipe *recipe16 = [Recipe new];
        recipe16.name = @"Ham and Cheese Panini";
        recipe16.prepTime = @"10 min";
        recipe16.image = @"ham_and_cheese_panini.jpg";
        
        
        recipes = [NSMutableArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5,
                   recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14,recipe15, recipe16, nil];
    }
    


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView
    dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
        Recipe *recipe = [recipes objectAtIndex:indexPath.row];
        cell.nameLabel.text = recipe.name;
        cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
        cell.prepTimeLabel.text = recipe.prepTime;
        cell.nameLabel.backgroundColor = [UIColor redColor];
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
    
    NSString* selectedRecipe = [recipes objectAtIndex:indexPath.row];
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
    [recipes removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  
}

@end
