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
@synthesize nSColorValue;

- (void)setName:(NSString *)newName {
	[_nameLabel setStringValue:newName];
}

- (void)setNSColorValue:(NSColor *)newValue {
//    _nameLabel.backgroundColor = newValue;
	_containerView.layer.backgroundColor = newValue.CGColor;
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
		_containerView.layer.cornerRadius = 10;
        _containerView.layer.borderWidth = 0.4;
        _containerView.layer.borderColor =
            [NSColor colorWithWhite:0.4 alpha:1.0].CGColor;
        
        

		[self addSubview:_containerView];
		[Utils constrainEdgesToSuperViewEdgesForView:
		 _containerView];

		// nameLabel
		_nameLabel = [[NSTextField alloc]
		              initWithFrame:CGRectZero];
		_nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
		_nameLabel.textColor = [NSColor whiteColor];
		_nameLabel.editable = NO;
		_nameLabel.bordered = NO;
		_nameLabel.backgroundColor = NSColor.clearColor;
		_nameLabel.alignment = NSTextAlignmentCenter;
		_nameLabel.maximumNumberOfLines = 1;
		_nameLabel.font = [Utils preferredFont];

		[_containerView addSubview:_nameLabel];
		[Utils centerWithinSuperViewForView:_nameLabel];
	}

	return self;
}

@end
