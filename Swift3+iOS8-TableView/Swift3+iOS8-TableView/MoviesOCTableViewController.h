//
//  MoviesOCTableViewController.h
//  Swift_ios8_tableView
//
//  Created by  李俊 on 2017/1/21.
//  Copyright © 2017年 Lijun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MoviesOCTableViewController : UITableViewController

@property (nonatomic, copy) NSArray<Movie *> *movies;

@end
