//
//  Task.h
//  Quiz7
//
//  Created by Vincent Pillinger on 4/9/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Task : NSManagedObject

@property (nonatomic) float urgency;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *dueDate;

@end
