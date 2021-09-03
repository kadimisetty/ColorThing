//
//  Utils.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "Utils.h"
#import <Cocoa/Cocoa.h>

@implementation Utils

+ (void) constrainEdgesToSuperViewEdgesForView: (NSView *) someView {
	NSView *someViewSuperview = someView.superview;

	[[someView.topAnchor
	  constraintEqualToAnchor: someViewSuperview.topAnchor ]
	 setActive: YES];
	[[someView.bottomAnchor
	  constraintEqualToAnchor: someViewSuperview.bottomAnchor ]
	 setActive:YES];
	[[someView.leadingAnchor
	  constraintEqualToAnchor: someViewSuperview.leadingAnchor ]
	 setActive:YES];
	[[someView.trailingAnchor
	  constraintEqualToAnchor: someViewSuperview.trailingAnchor ]
	 setActive:YES];
}

+ (void) centerWithinSuperViewForView: (NSView *) someView {
	NSView *someViewSuperview = someView.superview;

	[[someView.centerXAnchor
	  constraintEqualToAnchor: someViewSuperview.centerXAnchor]
	 setActive:YES];

	[[someView.centerYAnchor
	  constraintEqualToAnchor: someViewSuperview.centerYAnchor]
	 setActive:YES];
}


@end
