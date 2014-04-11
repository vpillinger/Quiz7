//
//  Q7DetailViewController.h
//  Quiz7
//
//  Created by Vincent Pillinger on 4/11/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface Q7DetailViewController : UIViewController <UISplitViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) Task *detailItem;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)save:(id)sender;
- (IBAction)urgencyValueChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
