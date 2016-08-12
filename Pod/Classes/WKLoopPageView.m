//
//  WKLoopPageView.m
//  Pods
//
//  Created by Wu Kong on 8/12/16.
//
//

#import "WKLoopPageView.h"
#import "WKImageView.h"
#import "UIView+WKUIKit.h"

#define kImageViewCount 3

@interface WKLoopPageView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WKLoopPageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    self.pageControl.frame = CGRectMake(0, self.height - 20, self.width ,20);
    
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WKImageView class]]) {
            WKImageView *imageView = (WKImageView *)obj;
            imageView.frame = CGRectMake(idx * self.width, 0, self.width, self.height);
        }
    }];
    
    self.scrollView.contentSize = CGSizeMake(self.width * kImageViewCount, self.height);
}

- (void)refreshImageView {
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WKImageView class]]) {
            WKImageView *imageView = (WKImageView *)obj;
            
            NSInteger *index = self.pageControl.currentPage;
            
            if (idx == 0) {
                index --;
                
            } else if(idx == (kImageViewCount - 1)) {
                index ++;
            }
            
            imageView.tag = index;
            imageView.imageUrlString = [self.imageUrls objectAtIndex:index];
        }
    }];
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width, 0);
    
}

- (void)next {
    [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.width, 0) animated:YES];
}

#pragma mark - 
#pragma mark Getters & Setters

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        
        for (int i = 0; i < kImageViewCount; i++) {
            WKImageView *imageView = [[WKImageView alloc] init];
            [self.scrollView addSubview:imageView];
        }
    }
    
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = kImageViewCount;
        _pageControl.currentPage = 0;
    }
    
    return _pageControl;
}

- (void)setImageUrls:(NSArray *)imageUrls {
    _imageUrls = imageUrls;
    [self startTimer];
}

#pragma mark - 
#pragma mark - Timers

- (void)startTimer {
    
    [self stopTimer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark -
#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self refreshImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    __block CGFloat minDistance = 0;
    __block CGFloat distance = 0;
    __block NSInteger page = 0;
    
    //计算CurrentPage
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[WKImageView class]]) {
            WKImageView *imageView = (WKImageView *)obj;
            distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
            if (distance < minDistance) {
                minDistance = distance;
                page = imageView.tag;
            }
        }
    }];
    
    
    self.pageControl.currentPage = 0;
}

//timer动画调用结束
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self refreshImageView];
}


@end
