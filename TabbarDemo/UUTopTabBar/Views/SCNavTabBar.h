//
//  SCNavTabBar.h
//  SCNavTabBarController
//
//  Created by Ge on 14/11/17.
//  Copyright (c) 2015 Ge. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DOT_COORDINATE       0.0f
#define kMyTripTabViewHeight 40
#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@protocol SCNavTabBarDelegate <NSObject>

@optional
/**
 *  When NavTabBar Item Is Pressed Call Back
 *
 *  @param index - pressed item's index
 */
- (void)itemDidSelectedWithIndex:(NSInteger)index;

@end

@interface SCNavTabBar : UIView

@property (nonatomic, weak)     id          <SCNavTabBarDelegate>delegate;

@property (nonatomic, assign)   NSInteger   currentItemIndex;           // current selected item's index
@property (nonatomic, strong)   NSArray     *itemTitles;                // all items' title

@property (nonatomic, strong)   UIColor     *lineColor;                 // set the underscore color
@property (nonatomic, strong)   UIColor     *titlesColor;               // set title's color

/**
 *  Initialize Methods
 *
 *  @param frame - SCNavTabBar frame
 *  @param show  - is show Arrow Button
 *
 *  @return Instance
 */
- (id)initWithFrame:(CGRect)frame;

/**
 *  Update Item Data
 */
- (void)updateData;

- (void)setLineCurrentPozition:(CGFloat)contentOffsetX;

@end
