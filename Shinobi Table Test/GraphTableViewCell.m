//
//  GraphTableViewCell.m
//  Shinobi Table Test
//
//  Created by David Wagner on 03/11/2015.
//  Copyright © 2015 David Wagner. All rights reserved.
//

#import "GraphTableViewCell.h"
#import <ShinobiCharts/ShinobiCharts.h>
#import "Licence.h"

@interface GraphTableViewCell () <SChartDatasource>

@property (weak, nonatomic) IBOutlet ShinobiChart *graph;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation GraphTableViewCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    _graph.licenseKey = LICENCE;
    _graph.datasource = self;
    _graph.loadDataInBackground = NO;
    
    SChartNumberAxis *xAxis = [[SChartNumberAxis alloc] init];
    xAxis.defaultRange = [[SChartRange alloc] initWithMinimum:@0 andMaximum:@10];
    xAxis.anchorPoint = @0;
    _graph.xAxis = xAxis;

    SChartNumberAxis *yAxis = [[SChartNumberAxis alloc] init];
    yAxis.defaultRange = [[SChartRange alloc] initWithMinimum:@0 andMaximum:@10];
    yAxis.anchorPoint = @0;
    yAxis.style.majorTickStyle.showTicks = YES;
    yAxis.style.majorTickStyle.lineLength = @3;
    yAxis.style.majorTickStyle.lineWidth = @1;
    yAxis.style.majorTickStyle.lineColor = [UIColor redColor];
    _graph.yAxis = yAxis;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateChart {
    _label.text = [NSString stringWithFormat:@"Data: %@", [_series componentsJoinedByString:@", "]];
    [_graph reloadData];
}

#pragma mark - SChartDatasource

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart*)chart {
    return 1;
}

- (NSInteger)sChart:(ShinobiChart*)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    return _series.count;
}

- (SChartSeries*)sChart:(ShinobiChart*)chart seriesAtIndex:(NSInteger)index {
    SChartLineSeries *lineSeries = [[SChartLineSeries alloc] init];
    lineSeries.baseline = @0;
    lineSeries.style.showFill = YES;
    return lineSeries;
}

- (id<SChartData>)sChart:(ShinobiChart*)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
    SChartDataPoint *point = [[SChartDataPoint alloc] init];
    point.xValue = @(dataIndex);
    point.yValue = _series[dataIndex];
    
    return point;
}


@end
