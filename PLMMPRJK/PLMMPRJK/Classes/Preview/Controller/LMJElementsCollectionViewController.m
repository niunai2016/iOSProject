//
//  LMJElementsCollectionViewController.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/4/19.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "LMJElementsCollectionViewController.h"

@interface LMJElementsCollectionViewController ()<LMJElementsFlowLayoutDelegate>

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<NSValue *> *elementsHight;


@end

@implementation LMJElementsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"京东首页布局";
    
    LMJElementsFlowLayout *elementsFlowLayout = [[LMJElementsFlowLayout alloc] init];
    elementsFlowLayout.delegate = self;
    
    self.collectionView.collectionViewLayout = elementsFlowLayout;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.elementsHight.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor RandomColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
    LMJLog(@"%zd", indexPath.item);
}

#pragma mark - LMJElementsFlowLayoutDelegate

- (CGSize)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.elementsHight[indexPath.item].CGSizeValue;
}

- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJWaterflowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(1, 10, 10, 10);
}


#pragma mark - LMJNavUIBaseViewControllerDataSource
//- (BOOL)navUIBaseViewControllerIsNeedNavBar:(LMJNavUIBaseViewController *)navUIBaseViewController
//{
//    return YES;
//}



#pragma mark - DataSource
/**头部标题*/
- (NSMutableAttributedString*)lmjNavigationBarTitle:(LMJNavigationBar *)navigationBar
{
    return [self changeTitle:self.title];
}

/** 背景图片 */
//- (UIImage *)lmjNavigationBarBackgroundImage:(LMJNavigationBar *)navigationBar
//{
//
//}

/** 背景色 */
//- (UIColor *)lmjNavigationBackgroundColor:(LMJNavigationBar *)navigationBar
//{
//
//}

/** 是否隐藏底部黑线 */
//- (BOOL)lmjNavigationIsHideBottomLine:(LMJNavigationBar *)navigationBar
//{
//    return NO;
//}

/** 导航条的高度 */
//- (CGFloat)lmjNavigationHeight:(LMJNavigationBar *)navigationBar
//{
//
//}


/** 导航条的左边的 view */
//- (UIView *)lmjNavigationBarLeftView:(LMJNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的 view */
//- (UIView *)lmjNavigationBarRightView:(LMJNavigationBar *)navigationBar
//{
//
//}
/** 导航条中间的 View */
//- (UIView *)lmjNavigationBarTitleView:(LMJNavigationBar *)navigationBar
//{
//
//}
/** 导航条左边的按钮 */
- (UIImage *)lmjNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LMJNavigationBar *)navigationBar
{
    
    [leftButton setTitle:@"< 返回" forState:UIControlStateNormal];
    
    leftButton.width = 60;
    
    [leftButton setTitleColor:[UIColor RandomColor] forState:UIControlStateNormal];
    
    return nil;
}
/** 导航条右边的按钮 */
- (UIImage *)lmjNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LMJNavigationBar *)navigationBar
{
    [rightButton setTitle:@"改变头图高度" forState:UIControlStateNormal];
    
    rightButton.width = 120;
    
    [rightButton setTitleColor:[UIColor RandomColor] forState:UIControlStateNormal];
    
    return nil;
}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    [self.elementsHight replaceObjectAtIndex:0 withObject:[NSValue valueWithCGSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) * 0.5, 44)]];
    
    [self.collectionView reloadData];
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    
}


#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(13) range:NSMakeRange(0, title.length)];
    
    return title;
}

- (NSMutableArray<NSValue *> *)elementsHight
{
    if(_elementsHight == nil)
    {
        _elementsHight = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 200; i++) {
            
            if (i == 0) {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 150)]];
                
            }else if (i == 1)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100)]];
                
            }else if (i == 2)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 60)]];
                
            }else if (i == 3)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 300)]];
            }else
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) * 0.5, ([UIScreen mainScreen].bounds.size.width - 30) * 0.5 * 0.8)]];
            }
            
            
            
        }
    }
    return _elementsHight;
}


@end
