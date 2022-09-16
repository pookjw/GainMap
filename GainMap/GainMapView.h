//
//  GainMapView.h
//  GainMap
//
//  Created by Jinwoo Kim on 9/16/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * GainMapViewRenderModeType NS_STRING_ENUM;
static GainMapViewRenderModeType const GainMapViewRenderModeTypeGainFill = @"gainFill";
static GainMapViewRenderModeType const GainMapViewRenderModeTypeGainBorderRenderFill = @"gainBorderRenderFill";

@interface GainMapView : UIView
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame renderMode:(GainMapViewRenderModeType)renderMode;
@end

NS_ASSUME_NONNULL_END
