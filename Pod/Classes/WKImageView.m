//
//  WKImageView.m
//  Pods
//
//  Created by Wu Kong on 8/6/16.
//
//

#import "WKImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation WKImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (void)setImageUrlString:(NSString *)imageUrlString {
    _imageUrlString = imageUrlString;
    [self setImageUrl:[NSURL URLWithString:imageUrlString]];
}

- (void)setImageUrl:(NSURL *)imageUrl {
    _imageUrl = imageUrl;
    [self sd_setImageWithURL:imageUrl placeholderImage:self.placeHolderImage];
}

@end
