//
//  DBManager.m
//  cs441_assignment6
//
//  Created by Kevin Wu on 4/25/19.
//  Copyright © 2019 Kevin Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

@end
