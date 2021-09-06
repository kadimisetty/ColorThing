//
//  Utils.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (void)constrainEdgesToSuperViewEdgesForView: (NSView *) someView;
+ (void)centerWithinSuperViewForView: (NSView *) someView;
+ (NSFont*)preferredFont;

@end

NS_ASSUME_NONNULL_END
