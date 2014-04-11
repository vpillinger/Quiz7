//
//  Q7MasterViewController.h
//  Quiz7
//
//  Created by Vincent Pillinger on 4/11/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
@class Q7DetailViewController;

#import <CoreData/CoreData.h>

@interface Q7MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) Q7DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
