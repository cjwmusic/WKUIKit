//
//  WKImageView.h
//  Pods
//
//  Created by Wu Kong on 8/6/16.
//
//

#import <UIKit/UIKit.h>

@interface WKImageView : UIImageView

@property (nonatomic, strong) UIImage *placeHolderImage;

@property (nonatomic, strong) NSString *imageUrlString;
@property (nonatomic, strong) NSURL *imageUrl;

@end
