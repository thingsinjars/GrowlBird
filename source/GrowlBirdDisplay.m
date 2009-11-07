//
//  GrowlBirdDisplay.h
//  Growl Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import "GrowlBirdDisplay.h"
#import "GrowlBirdWindowController.h"
#import "GrowlBirdPrefs.h"
#import "GrowlApplicationNotification.h"
#import <GrowlDefinesInternal.h>
#import <GrowlDefines.h>

@implementation GrowlBirdDisplay

- (id) init {
	if ((self = [super init])) {
		windowControllerClass = NSClassFromString(@"GrowlBirdWindowController");
		twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
	}
	return self;
}

- (void) dealloc {
	[preferencePane release];
	[super dealloc];
}

- (NSPreferencePane *) preferencePane {
	if (!preferencePane)
		preferencePane = [[GrowlBirdPrefs alloc] initWithBundle:[NSBundle bundleForClass:[GrowlBirdPrefs class]]];
	return preferencePane;
}

#pragma mark -
#pragma mark GrowlPositionController Methods
#pragma mark -

- (BOOL)requiresPositioning {
	return NO;
}

#pragma mark -
#pragma mark GAB
#pragma	mark -

- (void) displayNotification:(GrowlApplicationNotification *)notification {
	NSString *twitter_username = Bird_DEFAULT_USERNAME;
	NSString *twitter_password = Bird_DEFAULT_PASSWORD;
	READ_GROWL_PREF_VALUE(Bird_USERNAME_PREF, SamplePrefDomain, NSString *, &twitter_username);
	READ_GROWL_PREF_VALUE(Bird_PASSWORD_PREF, SamplePrefDomain, NSString *, &twitter_password);
	[twitterEngine setUsername:twitter_username password:twitter_password];
	
	NSString *title = [notification title];
	NSString *text  = [notification notificationDescription];

	NSString *tweet_prefix = Bird_DEFAULT_PREFIX;
	NSString *tweet_postfix = Bird_DEFAULT_POSTFIX;
	READ_GROWL_PREF_VALUE(Bird_PREFIX_PREF, SamplePrefDomain, NSString *, &tweet_prefix);
	READ_GROWL_PREF_VALUE(Bird_POSTFIX_PREF, SamplePrefDomain, NSString *, &tweet_postfix);

	int formatPref = Bird_FORMAT_BOTH;
	READ_GROWL_PREF_INT(Bird_FORMAT_PREF, SamplePrefDomain, &formatPref);
	if (formatPref == Bird_FORMAT_TITLE) {
		NSLog(@"sendUpdate: connectionIdentifier = %@", [twitterEngine sendUpdate:[NSString stringWithFormat:@"%@%@%@", tweet_prefix, title, tweet_postfix]]);
	} else if (formatPref == Bird_FORMAT_TEXT) {
		NSLog(@"sendUpdate: connectionIdentifier = %@", [twitterEngine sendUpdate:[NSString stringWithFormat:@"%@%@%@", tweet_prefix, text, tweet_postfix]]);
	} else {
		NSLog(@"sendUpdate: connectionIdentifier = %@", [twitterEngine sendUpdate:[NSString stringWithFormat:@"%@%@, %@%@", tweet_prefix, title, text, tweet_postfix]]);
	}

}

#pragma mark MGTwitterEngineDelegate Methods

- (void)requestSucceeded:(NSString *)requestIdentifier {
	
}
- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error {
	
}
- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier {
	
}
- (void)directMessagesReceived:(NSArray *)messages forRequest:(NSString *)identifier {
	
}
- (void)userInfoReceived:(NSArray *)userInfo forRequest:(NSString *)identifier {
	
}
- (void)miscInfoReceived:(NSArray *)miscInfo forRequest:(NSString *)identifier {
	
}
- (void)imageReceived:(NSImage *)image forRequest:(NSString *)identifier {
	
}


@end
