//
//  webserviceDownloader.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "webserviceDownloader.h"
#import "GlobalFunctions.h"
#import "EncryptionFunction.h"

@interface webserviceDownloader()

- (NSString *)urlEncodeString: (NSString *)str;
- (NSString *)convertDictionaryToUrlParamString: (NSDictionary *)dict;

@end

@implementation webserviceDownloader

@synthesize delegate;

- (void)dealloc
{
    delegate = nil;
    [super dealloc];
}


#pragma mark - 初始化
- (void)startWithURL:(NSURL *)url andPara:(NSMutableDictionary *)paraDict
{
    //建立URLRequest
    NSString *postString = [self convertDictionaryToUrlParamString:paraDict];
    //NSLog(@"post:%@",postString);
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    
    [urlRequest setHTTPBody:postData];
    [urlRequest setValue:[NSString stringWithFormat:@"%d",[postData length]] forHTTPHeaderField:@"Content-Length"];
    
    //NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [connection start];
}

- (void)startDownloadWithUrl:(NSURL*)url
{
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    //[urlRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    
    connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [connection start];
}

- (void)cancelDelegate
{
    [connection cancel];
    [responseData release], responseData = nil;;
}

#pragma mark - NSURLRequest delegate
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"did fail");
    [delegate webserviceDownloader:self didFaildRequestWithError:error];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
    //NSLog(@"did receive data %i",[data length]);
    [delegate webserviceDownloader:self didReceiveDataLength:[responseData length]];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = [[NSMutableData alloc] init];
    //NSLog(@"did receive responseData");
}
-(void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    NSLog(@"did finish loading with data:%i",[responseData length]);
    [connection cancel];
    [delegate webserviceDownloader:self didFinishRequestWithData:responseData];
}

#pragma mark - user define function
- (NSString *)convertDictionaryToUrlParamString: (NSDictionary *)dict 
{
    NSMutableString *paramString = [NSMutableString string];
    for (id key in dict) 
    {
        [paramString appendFormat:@"%@=%@&", [self urlEncodeString:key], [self urlEncodeString:[dict objectForKey:key]]];
    }
    return paramString;
}
- (NSString *)urlEncodeString: (NSString *)str 
{
    NSString *returnStr=[(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)str,  NULL,  (CFStringRef)@"!*'();:@&=+$,/?%#[]",  kCFStringEncodingUTF8) autorelease];
    return returnStr;
}


@end
