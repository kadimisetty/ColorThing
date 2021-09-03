//
//  CollectionViewItemView.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "CollectionViewItemView.h"
#import "Utils.h"

@implementation CollectionViewItemView {
	NSTextField* _nameLabel;
	NSView* _containerView;
}

// MARK: ATTRIBUTES

@synthesize name;

- (void)setName:(NSString *)newName {
	[_nameLabel setStringValue:newName];
}

// MARK: LAYOUT

- (instancetype)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// container view
		_containerView =
			[[NSView alloc] initWithFrame:frame];
		_containerView.translatesAutoresizingMaskIntoConstraints = NO;
		_containerView.wantsLayer = YES;
		_containerView.layer.backgroundColor = NSColor.systemTealColor.CGColor;
		_containerView.layer.cornerRadius = 5;

		[self addSubview:_containerView];
		[Utils constrainEdgesToSuperViewEdgesForView:
		 _containerView];

		// nameLabel
		_nameLabel = [[NSTextField alloc]
		              initWithFrame:CGRectZero];
		_nameLabel.textColor = [NSColor blackColor];
		_nameLabel.backgroundColor = [NSColor clearColor];
		_nameLabel.editable = NO;
		_nameLabel.bordered = YES;
		_nameLabel.alignment = NSTextAlignmentCenter;
		_nameLabel.maximumNumberOfLines = 1;
		_nameLabel.translatesAutoresizingMaskIntoConstraints = NO;

		[_containerView addSubview:_nameLabel];
		[Utils centerWithinSuperViewForView:_nameLabel];
	}

	return self;
}

@end
