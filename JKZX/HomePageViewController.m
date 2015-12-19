//
//  HomePageViewController.m
//  JKZX
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "HomePageViewController.h"
#import "InformationDataController.h"
#import "ClassificationModel.h"
#import "ListPageViewController.h"

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,NetworkCallbackDelegate>
{
    UITableView *_tableView;
    ClassificationModel *_classModel;
}
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTableView];
    [self loadNetworkData];
}

- (void)loadNetworkData{
    [InformationDataController getCallbackWithClassificationModelDelegate:self RequestCode:0];
}

- (void)callbackWithData:(id)data{
    dispatch_async(dispatch_get_main_queue(), ^{
        _classModel = data;
        [_tableView reloadData];
    });
}

- (void)creatTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _classModel.tngou.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELLID"];
    }
    ItemsModel *itemModel = [_classModel.tngou objectAtIndex:indexPath.row];
    cell.textLabel.text = itemModel.title;

    cell.detailTextLabel.text = itemModel.Description;
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = @"食品新闻,食品安全新闻,食品资讯,食品行业新闻,餐饮资讯,提供专业的食品新闻查询,食品新闻网";
    }
    cell.detailTextLabel.numberOfLines = 0;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle =  UITableViewCellSelectionStyleBlue;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListPageViewController *listPage = [[ListPageViewController alloc] init];
    ItemsModel *items = [_classModel.tngou objectAtIndex:indexPath.row];
    listPage.ID = items.Id;
    [self.navigationController pushViewController:listPage animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.navigationItem.title = @"资讯列表";
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.navigationItem.title = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
