//
//  AddRecipeViewController.m
//  RecipeStore
//
//  Created by Anuj Katiyal on 17/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "AddRecipeViewController.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.recipe){
        [self.nameTextField setText:[self.recipe valueForKey:@"name"]];
        [self.imageTextField setText:[self.recipe valueForKey:@"image"]];
        [self.prepTimeTextField setText:[self.recipe valueForKey:@"prepTime"]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    //Create a new object
    if (self.recipe) {
        [self.recipe setValue:self.nameTextField.text forKey:@"name"];
        [self.recipe setValue:self.imageTextField.text forKey:@"image"];
        [self.recipe setValue:self.prepTimeTextField.text forKey:@"prepTime"];
    } else {
        NSManagedObject *newRecipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
        [newRecipe setValue:self.nameTextField.text forKey:@"name"];
        [newRecipe setValue:self.imageTextField.text forKey:@"image"];
        [newRecipe setValue:self.prepTimeTextField.text forKey:@"prepTime"];
    }
    
    NSError *error = nil;
    //Save the object
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
