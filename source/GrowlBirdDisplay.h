//
//  GrowlBirdDisplay.h
//  Growl Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GrowlDisplayPlugin.h>
#import "MGTwitterEngine.h"

// @class GrowlApplicationNotification;
 
@interface GrowlBirdDisplay : GrowlDisplayPlugin <MGTwitterEngineDelegate> {
	MGTwitterEngine *twitterEngine;
}

- (void) displayNotification:(GrowlApplicationNotification *)notification;

@end
