//
//  HTKindSelectVC.m
//  XuanYuan
//
//  Created by niesiyang-worker on 2018/1/20.
//  Copyright © 2018年 聂嗣洋. All rights reserved.
//

#import "HTKindSelectVC.h"
#import "HTKindAddVC.h"

@interface HTKindSelectVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView * tableView;

@end

@implementation HTKindSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNavigationBar];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.tableView) {
        [self.tableView reloadData];
    }
}



-(void)configNavigationBar
{

    self.title = @"分类";
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(NavigationBarTintColor);
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn dk_setImage:^UIImage *(DKThemeVersion *themeVersion) {
        if ([themeVersion isEqualToString:DKThemeVersionNormal])
        {
            return [UIImage imageNamed:@"icon_add_nor"];
        }else
        {
            return [UIImage imageNamed:@"icon_add_nor"];
        }
    } forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    __weak typeof(self) __self = self;
    [rightBtn addClickBlock:^(id obj) {
        HTKindAddVC *vc = [[HTKindAddVC alloc]init];
        [__self.navigationController pushViewController:vc animated:YES];
    }];
    
}

-(void)creatUI
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    tableView.dk_backgroundColorPicker = DKColorPickerWithKey(TableViewBackgroundColor);
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.bottom.right.equalTo(self.view);
    }];

}


#pragma -mark- tableView delegate  datasuoce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RLMResults<HTMainAccountsKindModel *> *modelList = [HTMainAccountsKindModel allObjects];
    return modelList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.dk_textColorPicker = DKColorPickerWithKey(textColor_0);
    }
    RLMResults<HTMainAccountsKindModel *> *modelList = [HTMainAccountsKindModel allObjects];
    HTMainAccountsKindModel *model = [modelList objectAtIndex:indexPath.row];
    cell.textLabel.text = model.kindName;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    // 返回你所需要的状态栏样式
    return UIStatusBarStyleLightContent;
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
