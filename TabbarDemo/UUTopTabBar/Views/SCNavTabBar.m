//
//  SCNavTabBar.m
//  SCNavTabBarController
//
//  Created by Ge on 14/11/17.
//  Copyright (c) 2015 Ge. All rights reserved.
//

#import "SCNavTabBar.h"
#import "GlobalMacros.h"

@interface SCNavTabBar ()
{
    UIScrollView    *_navgationTabBar;      // all items on this scroll view
    
    UIView          *_line;                 // underscore show which item selected
    
    NSMutableArray  *_items;                // SCNavTabBar pressed item
    
    NSArray         *_itemsWidth;           // an array of items' width
}

@end

@implementation SCNavTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initConfig];
    }
    return self;
}

#pragma mark -
#pragma mark - Private Methods

- (void)initConfig
{
    _items = [@[] mutableCopy];
    
    [self viewConfig];
}

- (void)viewConfig
{
    CGFloat functionButtonX = kMainScreenWidth;

    _navgationTabBar = [[UIScrollView alloc] initWithFrame:CGRectMake(DOT_COORDINATE, DOT_COORDINATE, functionButtonX, kMyTripTabViewHeight)];
    _navgationTabBar.showsHorizontalScrollIndicator = NO;
    [self addSubview:_navgationTabBar];
    
    [self viewShowShadow:self shadowRadius:10.0f shadowOpacity:10.0f];
}

- (void)showLineWithButtonWidth:(CGFloat)width
{
    _line = [[UIView alloc] initWithFrame:CGRectMake(2.0f, kMyTripTabViewHeight - 3.0f, width - 4.0f, 3.0f)];
    _line.backgroundColor = UIColorWithRGBA(20.0f, 80.0f, 200.0f, 0.7f);
    [_navgationTabBar addSubview:_line];
}

- (CGFloat)contentWidthAndAddNavTabBarItemsWithButtonsWidth:(NSArray *)widths
{
    CGFloat buttonX = DOT_COORDINATE;
    for (NSInteger index = 0; index < [_itemTitles count]; index++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, DOT_COORDINATE, [widths[index] floatValue], kMyTripTabViewHeight);
        [button setTitle:_itemTitles[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_navgationTabBar addSubview:button];
        
        [_items addObject:button];
        buttonX += [widths[index] floatValue];
        if (!index) {
            [button setTitleColor:self.titlesColor forState:UIControlStateNormal];
        }
    }
    
    [self showLineWithButtonWidth:[widths[0] floatValue]];
    return buttonX;
}

- (void)itemPressed:(UIButton *)button
{
    NSInteger index = [_items indexOfObject:button];
    [_delegate itemDidSelectedWithIndex:index];
    [self setCurrentItemIndex:index];
}


- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles;
{
    NSMutableArray *widths = [@[] mutableCopy];
    if (titles.count <= 5) {
        for (NSInteger i = 0; i < titles.count ; i++)
        {
            NSNumber *width = [NSNumber numberWithFloat:[[UIScreen mainScreen] bounds].size.width / titles.count];
            [widths addObject:width];
        }
        return widths;
    }
    
    for (NSString *title in titles)
    {
        NSDictionary *dict = @{
                                NSFontAttributeName:[UIFont systemFontOfSize:[UIFont systemFontSize]]
                                };
        CGSize size = [title sizeWithAttributes:dict];
        NSNumber *width = [NSNumber numberWithFloat:size.width + 40.0f];
        [widths addObject:width];
    }
    
    return widths;
}

- (void)viewShowShadow:(UIView *)view shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity
{
    view.layer.shadowRadius = shadowRadius;
    view.layer.shadowOpacity = shadowOpacity;
}


#pragma mark -
#pragma mark - Public Methods


- (void)setCurrentItemIndex:(NSInteger)currentItemIndex
{
    _currentItemIndex = currentItemIndex;
    UIButton *button = _items[currentItemIndex];
    CGFloat flag = kMainScreenWidth;
    
    if (button.frame.origin.x + button.frame.size.width > flag)
    {
        CGFloat offsetX = button.frame.origin.x + button.frame.size.width - flag;
        if (_currentItemIndex < [_itemTitles count] - 1)
        {
            offsetX = offsetX + 40.0f;
        }
        
        [_navgationTabBar setContentOffset:CGPointMake(offsetX, DOT_COORDINATE) animated:YES];
    }
    else
    {
        [_navgationTabBar setContentOffset:CGPointMake(DOT_COORDINATE, DOT_COORDINATE) animated:YES];
    }
    for (NSInteger i=0; i<_items.count; i++) {
        UIButton *buttonAll = _items[i];
        [buttonAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [button setTitleColor:self.titlesColor forState:UIControlStateNormal];

}
- (void)setLineCurrentPozition:(CGFloat)contentOffsetX
{
    [UIView animateWithDuration:0.2f animations:^{
        _line.frame = CGRectMake(contentOffsetX / _itemTitles.count, _line.frame.origin.y, _line.frame.size.width, _line.frame.size.height);
    }];
}

- (void)updateData
{
    
    _itemsWidth = [self getButtonsWidthWithTitles:_itemTitles];
    if (_itemsWidth.count)
    {
        CGFloat contentWidth = [self contentWidthAndAddNavTabBarItemsWithButtonsWidth:_itemsWidth];
        _navgationTabBar.contentSize = CGSizeMake(contentWidth, DOT_COORDINATE);
    }
}
@end

