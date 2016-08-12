//
//  WKButton.m
//  Pods
//
//  Created by Wu Kong on 8/12/16.
//
//

#import "WKButton.h"

@implementation WKButton

- (instancetype)initWithImageName:(NSString *)imageName {
    if (self = [super init]) {
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return self;
}

@end
