//
//  webserviceDownloader.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "webservice_constant.h"

@class webserviceDownloader;
@protocol webserviceDownloaderDelegate <NSObject>

- (void)webserviceDownloader:(webserviceDownloader*)loader didFinishRequestWithData:(NSData*)data;
- (void)webserviceDownloader:(webserviceDownloader *)loader didReceiveDataLength:(NSUInteger)length;
- (void)webserviceDownloader:(webserviceDownloader *)loader didFaildRequestWithError:(NSError*)error;

@end

@interface webserviceDownloader : NSObject
{
    id<webserviceDownloaderDelegate>delegate;
    NSMutableData *responseData;
    NSURLConnection *connection;
}

@property (assign) id<webserviceDownloaderDelegate> delegate;

- (void)startWithURL:(NSURL*)url andPara:(NSMutableDictionary*)paraDict;
- (void)startDownloadWithUrl:(NSURL*)url;
- (void)cancelDelegate;
@end
