//***************************************************************************

// Copyright (C) 2009 ~ 2010 Realmac Software Ltd
//
// These coded instructions, statements, and computer programs contain
// unpublished proprietary information of Realmac Software Ltd
// and are protected by copyright law. They may not be disclosed
// to third parties or copied or duplicated in any form, in whole or
// in part, without the prior written consent of Realmac Software Ltd.

//***************************************************************************

#import "RWHTMLPlugin.h"
#import "RWHTMLPluginContentViewController.h"
#import "RWHTMLViewCM.h"

//***************************************************************************

@implementation RWHTMLPluginContentViewController

@dynamic content;

- (NSString *)content
{
	return [htmlView string];
}

- (void)textDidChange:(NSNotification *)aNotification
{
	RWHTMLPlugin *p = self.representedObject;
	
	[p broadcastPluginChanged];
}

- (void)awakeFromNib
{
	RWHTMLPlugin *p = self.representedObject;
	NSString *string = p.content;
	
	if (string)
	{
		[htmlView setString:string lazily:YES];
		[htmlView colorize];
	}
}

- (id)initWithRepresentedObject:(id)inObject
{
	self = [super initWithNibName:@"RWHTMLPluginContentView" bundle:[RWHTMLPlugin bundle]];
	
	if (self)
	{
		[self setRepresentedObject:inObject];
	}
	
	return self;
}

@end

//***************************************************************************