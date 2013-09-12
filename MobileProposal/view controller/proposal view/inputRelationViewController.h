//
//  inputRelationViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/28.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol inputRelationAction <NSObject>

- (void)didSelectRelationWithClientId:(NSString*)clientId andRelation:(NSString*)relation andRelationName:(NSString*)renationName;

@end
@interface inputRelationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    id <inputRelationAction> delegate;
    IBOutlet UITableView *aTableView;
    NSArray *customerArray;
    NSString *clientId;
}

@property (assign) id <inputRelationAction> delegate;
@property (nonatomic, retain) NSArray *customerArray;
@property (nonatomic, retain) NSString *clientId;

@end
