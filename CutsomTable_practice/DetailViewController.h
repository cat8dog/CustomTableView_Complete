#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@property (nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, strong) NSString *prepTimeName;

@end
