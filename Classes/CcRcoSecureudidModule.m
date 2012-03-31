/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "CcRcoSecureudidModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "SecureUDID.h"

NSString *domain = @"com.example.myapp";
NSString *key = @"superSecretCodeHere!@##%#$#%$^";

@implementation CcRcoSecureudidModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"633fd95c-6cdc-4ff4-82a8-974179e2a489";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"cc.rco.secureudid";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)config:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args,NSDictionary);

    domain = [TiUtils stringValue:[args objectForKey:@"domain"]];
    key = [TiUtils stringValue:[args objectForKey:@"key"]];    
}

-(id)getUDID
{
    NSString *udid = [SecureUDID UDIDForDomain:domain usingKey:key];
    // The returned udid is a 36 character (128 byte + 4 dashes) string that is unique for that domain, salt, and device tuple.
    
    NSLog(@"[INFO] %@ Generated SecureUDID:",self);
    NSLog(@"[INFO] %@", udid);
	return udid;
}

@end
