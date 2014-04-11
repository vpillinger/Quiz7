//
//  Q7DetailViewController.m
//  Quiz7
//
//  Created by Vincent Pillinger on 4/11/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import "Q7DetailViewController.h"

@interface Q7DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation Q7DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    // Update the user interface for the detail item.
    if (self.detailItem) {
        [self.nameTextField setText:[self.detailItem name]];
        [self.urgencySlider setValue:[self.detailItem urgency]];
        [self.datePicker setDate:[self.detailItem dueDate]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.nameTextField setDelegate:self];
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
- (IBAction)save:(id)sender
{
    [self.detailItem setName:[self.nameTextField text]];
    [self.detailItem setUrgency:[self.urgencySlider value]];
    [self.detailItem setDueDate:[self.datePicker date]];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)urgencyValueChanged:(id)sender{
    float newUrgencyValue = [_urgencySlider value];
    
    [_urgencyLabel setText:[NSString stringWithFormat:@"%f", newUrgencyValue]];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
