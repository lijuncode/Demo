//
//  MoviesOCTableViewController.m
//  Swift_ios8_tableView
//
//  Created by  李俊 on 2017/1/21.
//  Copyright © 2017年 Lijun. All rights reserved.
//

#import "MoviesOCTableViewController.h"
#import "Swift3_iOS8_TableView-Swift.h"

@implementation MoviesOCTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"OC-ViewController";
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)setMovies:(NSArray<Movie *> *)movies
{
  _movies = [movies copy];
  [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.text = self.movies[indexPath.row].intro;
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] init];
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.text = self.movies[indexPath.row].intro;
  return [cell sizeThatFits:tableView.bounds.size].height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
