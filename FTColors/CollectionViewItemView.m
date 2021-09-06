//
//  CollectionViewItemView.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "CollectionViewItemView.h"
#import "Utils.h"

@implementation CollectionViewItemView {
	NSButton* nameButton;
	NSView* containerView;
}

// MARK: ATTRIBUTES

@synthesize name;
@synthesize nSColorValue;

- (void)setName:(NSString *)newName {
	self->nameButton.attributedTitle =
		[[NSAttributedString alloc]
		 initWithString: newName
		 attributes: [self buttonTextStyleAttributesDict]];
}

- (void)setNSColorValue:(NSColor *)newValue {
	self->containerView.layer.backgroundColor = newValue.CGColor;
}

- (NSDictionary *)buttonTextStyleAttributesDict {
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [Utils preferredFont], NSFontAttributeName,
            [NSColor blackColor], NSForegroundColorAttributeName,
            nil];
}

// MARK: LAYOUT

- (instancetype)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self->containerView = [[NSView alloc] initWithFrame:frame];
		self->containerView.translatesAutoresizingMaskIntoConstraints = NO;
		self->containerView.wantsLayer = YES;
		self->containerView.layer.cornerRadius = 4;
		self->containerView.layer.borderWidth = 0.4;
		self->containerView.layer.borderColor =
			[NSColor colorWithWhite:0.4 alpha:1.0].CGColor;

		[self addSubview:self->containerView];
		[Utils constrainEdgesToSuperViewEdgesForView:
		 self->containerView];

        self->nameButton = [[NSButton alloc] initWithFrame:CGRectZero];
		self->nameButton.translatesAutoresizingMaskIntoConstraints = NO;
        // TODO: Fix issue with not showing after clicked.
		[self->nameButton setButtonType:NSButtonTypeMomentaryLight];
        [self->nameButton setButtonType:NSButtonTypeMomentaryChange];
		self->nameButton.alignment = NSTextAlignmentCenter;
		self->nameButton.bordered = NO;
		self->nameButton.target = self;
		self->nameButton.action = @selector(nameButtonClicked);
		self->nameButton.font = [Utils preferredFont];

		[self->containerView addSubview:self->nameButton];
		[Utils constrainEdgesToSuperViewEdgesForView:self->nameButton];
	}

	return self;
}

- (void)nameButtonClicked {
	[Utils showModalAlert:@"ZOINK!"];
}
@end
