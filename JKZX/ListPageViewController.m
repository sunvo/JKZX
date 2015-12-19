//
//  ListPageViewController.m
//  JKZX
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 张旭华. All rights reserved.
//

#import "ListPageViewController.h"
#import "InformationDataController.h"
#import "LIstModel.h"

#import <UIImageView+WebCache.h>

@interface ListPageViewController ()<NetworkCallbackDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    LIstModel *_listModel;
    NSInteger _page;
}


@end

@implementation ListPageViewController

@synthesize ID;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page = 1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self creatTableView];
    [self loadNetworkData];
}

- (void)creatTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource= self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listModel.tngou.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Id"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Id"];
    }
    ListItemModel *item = [_listModel.tngou objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.Description;
    cell.detailTextLabel.numberOfLines = 3;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://tnfs.tngou.net/img%@",item.img]] placeholderImage:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (void)loadNetworkData{
    [InformationDataController getCallbackWithId:ID Page:_page ClassificationModelDelegate:self RequestCode:0];
}

- (void)callbackWithData:(id)data{
     _listModel = data;
    dispatch_async(dispatch_get_main_queue(), ^{
//        _listModel = data;
        [_tableView reloadData];
    });
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
