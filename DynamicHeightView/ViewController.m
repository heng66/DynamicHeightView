//
//  ViewController.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "ViewController.h"
#import "DynamicTableViewCell.h"

static NSString *identify = @"DynamicTableViewCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高度动态布局";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    cell.dataArr = self.dataArr[indexPath.row];
    return  cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.rowHeight;
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        [_tableView registerClass:[DynamicTableViewCell class] forCellReuseIdentifier:identify];
    }
    return _tableView;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"成都",@"天津"],@[@"重庆",@"武汉",@"贵阳",@"郑州",@"济南",@"西安",@"合肥",@"南京",@"南宁",@"太原",@"昆明",@"福州"],@[@"宁波",@"青岛",@"大连",@"珠海",@"厦门",@"上海",@"烟台"],@[@"成都",@"德阳",@"绵阳",@"遂宁",@"广元",@"内江",@"简阳",@"泸州",@"达州",@"巴中",@"广安",@"双流",@"射阳",@"温江",@"都江堰",@"金牛",@"高新",@"绵竹",@"武侯",@"郫县",@"彭州",@"龙泉驿",@"崇州",@"新津",@"邛崃",],@[@"金堂",@"金牛",@"内江",@"高新",@"合肥",@"合肥",@"合肥"],@[@"合肥",@"合肥",@"合肥",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明"],@[@"珠海",@"珠海",@"珠海",@"珠海",@"珠海",@"珠海",@"珠海"],@[@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳"]];
    }
    return _dataArr;
}

@end
