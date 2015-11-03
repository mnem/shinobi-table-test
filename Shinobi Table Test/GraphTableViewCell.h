//
//  GraphTableViewCell.h
//  Shinobi Table Test
//
//  Created by David Wagner on 03/11/2015.
//  Copyright © 2015 David Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphTableViewCell : UITableViewCell

@property (strong, nonatomic) NSArray<NSNumber *> *series;

+ (NSString *)reuseIdentifier;

- (void)updateChart;

@end
