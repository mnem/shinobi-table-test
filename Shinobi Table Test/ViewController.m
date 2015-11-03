//
//  ViewController.m
//  Shinobi Table Test
//
//  Created by David Wagner on 03/11/2015.
//  Copyright © 2015 David Wagner. All rights reserved.
//

#import "ViewController.h"
#import "GraphTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary<NSString *, NSArray *> *sections;
@property (readonly, nonatomic) NSArray<NSString *> *sectionTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTestData];
    [self setupTableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_tableView reloadData];
}

- (void)setupTableView {
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)setupTestData {
    _sections = @{
                  @"Section 01": @[
                          @[@1, @1, @1, @1, @1, @1],
                          ],
                  @"Section 02": @[
                          @[@2, @2, @2, @2, @2, @2],
                          ],
                  @"Section 03": @[
                          @[@3, @3, @3, @3, @3, @3],
                          ],
                  @"Section 04": @[
                          @[@4, @4, @4, @4, @4, @4],
                          ],
                  @"Section 05": @[
                          @[@5, @5, @5, @5, @5, @5],
                          ],
                  @"Section 06": @[
                          @[@6, @6, @6, @6, @6, @6],
                          ],
                  @"Section 07": @[
                          @[@7, @7, @7, @7, @7, @7],
                          ],
                  @"Section 08": @[
                          @[@8, @8, @8, @8, @8, @8],
                          ],
                  @"Section 09": @[
                          @[@9, @9, @9, @9, @9, @9],
                          ],
                  @"Section 10": @[
                          @[@10, @10, @10, @10, @10, @10],
                          ],
                  };
}

- (NSArray<NSString *> *)sectionTitles {
    return [[_sections allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sections[self.sectionTitles[section]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GraphTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[GraphTableViewCell reuseIdentifier] forIndexPath:indexPath];
    
    cell.series = _sections[self.sectionTitles[indexPath.section]][indexPath.row];
    [cell updateChart];
    
    return cell;
}

// Default is 1 if not implemented
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return _sections.count;
 }

 - (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
     return self.sectionTitles[section];
 }

@end
