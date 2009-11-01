//
//  GrowlBirdWindowController.h
//  Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import "GrowlDisplayWindowController.h"

@class GrowlBirdWindowView;

@interface GrowlBirdWindowController : GrowlDisplayWindowController {
	CGFloat						frameHeight;
	NSInteger					priority;
	NSPoint						frameOrigin;
}
	
@end
