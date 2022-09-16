//
//  GainMapView.m
//  GainMap
//
//  Created by Jinwoo Kim on 9/16/22.
//

#import "GainMapView.h"
#import <objc/message.h>

@implementation GainMapView

+ (Class)layerClass {
  return NSClassFromString(@"CAGainMapLayer");
}

- (instancetype)initWithFrame:(CGRect)frame renderMode:(GainMapViewRenderModeType)renderMode {
  if (self = [super initWithFrame:frame]) {
    ((void (*)(id, SEL, NSString *))objc_msgSend)(self.layer, NSSelectorFromString(@"setRenderMode:"), renderMode);
  }

  return self;
}

@end
