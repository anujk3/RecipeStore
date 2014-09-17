//
//  AddRecipeViewController.h
//  RecipeStore
//
//  Created by Anuj Katiyal on 17/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRecipeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *imageTextField;
@property (weak, nonatomic) IBOutlet UITextField *prepTimeTextField;

@property (strong) NSManagedObject *recipe;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
