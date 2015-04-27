#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (strong, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic, strong) IBOutlet UILabel *prepTimeLabel;

@property (nonatomic, strong) Recipe *recipe; 

@end
