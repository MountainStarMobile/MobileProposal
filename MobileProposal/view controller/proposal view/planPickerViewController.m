//
//  planPickerViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/21.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "planPickerViewController.h"
#import "DatabaseAccess.h"
#import "switchFunction.h"
#import "MathFunction.h"
#import "systemParamater.h"
#import "savePlanInfo.h"
#import "pldf.h"
#import "inputRecord.h"
#import "switchFunction.h"
#import "infoPanel.h"
#import "pratTableViewController.h"

typedef NS_ENUM(NSUInteger, PlanSectionType) {
    PlanSectionTypeSelect,
    PlanSectionTypeInput,
};

@interface planPickerViewController ()
{
    NSMutableString *proposalType;
    NSArray *planCategoryArray;
    NSArray *planTypeArray;
    NSMutableArray *planAbbrArray;
    NSMutableArray *selectFields;
    NSMutableArray *inputFields;
    savePlanInfo *aPlanInfo;
    inputRecord *aInputRecord;
    UITextField *currentField;
}

@property (nonatomic, retain) pldf *aPldf;

- (void)createBarItem;
- (void)addPlanItem;
- (void)resetInputFields;
- (void)createToolBarForKeyBoard:(UITextField*)field;

@end

@implementation planPickerViewController
@synthesize customerArray, isModify;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        if (planTypeArray == nil)
        {
            /*
             主 / 附約
             */
            if (planCategoryArray == nil)
            {
                planCategoryArray = [[NSArray alloc] initWithObjects:
                                     planCategoryMain,
                                     planCategoryElse,
                                     nil];
            }
            /*
             人壽,健康,傷害,年金,投資型壽險,投資型年金
             */
            planTypeArray = [[NSArray alloc] initWithObjects:
                             planTypeL,
                             planTypeR,
                             planTypeA,
                             planTypeM,
                             planTypeC,
                             planTypeV,
                             planTypeAn,
                             nil];
        }
        if (planAbbrArray == nil)
        {
            planAbbrArray = [[NSMutableArray alloc] initWithCapacity:0];
        }
        if (selectFields == nil)
        {
            selectFields = [[NSMutableArray alloc] initWithObjects:
                            input_relation,
                            selectPlanCategory,
                            selectPlanTypeKey,
                            selectPlanAbbrKey,
                            nil];
        }
        if (inputFields == nil)
        {
            inputFields = [[NSMutableArray alloc] initWithCapacity:0];
        }
        if (aInputRecord == nil)
        {
            aInputRecord = [inputRecord new];
        }
        if (proposalType == nil)
        {
            proposalType = [[NSMutableString alloc] initWithString:proposalType_lf];
        }
        [self resetInputFields];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (isModify)
    {
        self.title = NSLocalizedString(@"修改險種", @"");
    }
    else
    {
        self.title = NSLocalizedString(@"新增險種", @"");
    }
    if (aPlanInfo == nil)
    {
        aPlanInfo = [savePlanInfo new];
    }
    if (self.aPldf == nil)
    {
        self.aPldf = [pldf new];
    }
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    [aTableView setDelegate:self];
    [aTableView setDataSource:self];
    [self createBarItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [planTypeArray release], planTypeArray = nil;
    [planAbbrArray release], planAbbrArray = nil;
    [planCategoryArray release], planCategoryArray = nil;
    [inputFields release], inputFields = nil;
    [proposalType release], proposalType = nil;
    [customerArray release], customerArray = nil;
    [_aPldf release], _aPldf = nil;
    [super dealloc];
}

- (IBAction)selectProposal:(id)sender
{
    if(dropDown == nil)
    {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc] showDropDown:sender andHeight:f andArr:planTypeArray];
        //dropDown = [[NIDropDown alloc]showDropDown:sender :&f :planTypeArray];
        dropDown.delegate = self;
    }
    else
    {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == PlanSectionTypeSelect)
    {
        return [selectFields count];
    }
    return [inputFields count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == PlanSectionTypeSelect)
        return 40;
    return 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == PlanSectionTypeSelect)
    {
        selectPlanHeaderView *headerView = nil;
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"selectPlanHeaderView" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[selectPlanHeaderView class]])
            {
                headerView = currentObj;
                break;
            }
        }
        [headerView setDelegate:self];
        [headerView.titleLabel setText:[NSString stringWithFormat:@"請選擇險種"]];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == PlanSectionTypeInput)
        return 40;
    return 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    selectPlanFooterView *footerView = nil;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"selectPlanFooterView" owner:self options:nil];
    for (id currentObj in topLevelObjects)
    {
        if ([currentObj isKindOfClass:[selectPlanFooterView class]])
        {
            footerView = currentObj;
            break;
        }
    }
    NSString *unit = [[switchFunction switchFunctionInstance] GetFaceAmtUnit:[self.aPldf.unitValue integerValue] andFaceAmtType:self.aPldf.faceAmtType];
    NSString *message = [NSString stringWithFormat:@"保額範圍:%@%@ ~ %@%@", self.aPldf.faceAmtMini,unit, self.aPldf.faceAmtMaxi, unit];
    if (self.aPldf != nil)
        [footerView.messageLabel setText:message];
    else
        [footerView.messageLabel setText:@""];
    [footerView.pratButton addTarget:self action:@selector(queryPratButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *selectCellIdentifier = @"selectCellIdentifier";
    static NSString *inputCellIdentifier = @"selectCellIdentifier";
    NSUInteger sec = [indexPath section];
    NSUInteger row = [indexPath row];
    if (sec == PlanSectionTypeSelect)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectCellIdentifier];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:selectCellIdentifier] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            [cell.textLabel setTextColor:[UIColor darkGrayColor]];
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
            [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        }
        NSString *key = [selectFields objectAtIndex:row];
        [cell.textLabel setText:[[switchFunction switchFunctionInstance] GetSelectPlanAidNameWithKey:[selectFields objectAtIndex:row]]];
        if ([key isEqualToString:input_relation])
        {
            [cell.detailTextLabel setText:[[switchFunction switchFunctionInstance] GetRelationNameWithKey:aInputRecord.relation]];
        }
        else if ([key isEqualToString:selectPlanCategory])
        {
            NSString *tmpCategory = [[switchFunction switchFunctionInstance] GetPlanCategoryNameWithIndex:[aInputRecord.planCategory integerValue]];
            [cell.detailTextLabel setText:[[switchFunction switchFunctionInstance] GetPlanCategoryNameWithKey:tmpCategory]];
        }
        else if ([key isEqualToString:selectPlanTypeKey])
        {
            [cell.detailTextLabel setText:[[switchFunction switchFunctionInstance] GetPlanTypeNameWithPlanType:aInputRecord.planType]];
        }
        else if ([key isEqualToString:selectPlanAbbrKey])
        {
            [cell.detailTextLabel setText:aInputRecord.planAbbrDesc];
        }
        else if ([key isEqualToString:selectPlanAidKey])
        {
            [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@, %@",
                                           aInputRecord.planOrderDesc==nil?@"":aInputRecord.planOrderDesc,
                                           aInputRecord.planCodeOrderDesc==nil?@"":aInputRecord.planCodeOrderDesc]];
        }
        else if ([key isEqualToString:selectPlanCodeKey])
        {
            if ([aInputRecord.relation isEqualToString:relationI1])
            {
                [cell.detailTextLabel setText:aInputRecord.IplanCode];
            }
            else if ([aInputRecord.relation isEqualToString:relationSS])
            {
                [cell.detailTextLabel setText:aInputRecord.SplanCode];
            }
            else if ([aInputRecord.relation isEqualToString:relationC])
            {
                [cell.detailTextLabel setText:aInputRecord.CplanCode];
            }
        
        }
        return cell;
    }
    else
    {
        NSString *key = [inputFields objectAtIndex:row];
        
        if ([key isEqualToString:input_faceamt])
        {
            /*
            inputFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:inputFieldCellIdentifier];
            if (cell == nil)
            {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"inputFieldCell" owner:self options:nil];
                for (id currentObj in topLevelObjects)
                {
                    if ([currentObj isKindOfClass:[inputFieldCell class]])
                    {
                        cell = currentObj;
                        break;
                    }
                }
                [cell setAccessoryType:UITableViewCellAccessoryNone];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [self createToolBarForKeyBoard:cell.inputField];
            [cell.inputField setDelegate:self];
            [cell.inputField setKeyboardType:UIKeyboardTypeDefault];
            [cell.titleLabel setText:[NSString stringWithFormat:@"保額"]];
            [cell.inputField setPlaceholder:[NSString stringWithFormat:@"請輸入保額"]];
            
            return cell;
             */
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inputCellIdentifier];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inputCellIdentifier] autorelease];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                [cell.textLabel setTextColor:[UIColor darkGrayColor]];
                [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
                [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
            }
            [cell.textLabel setText:[[switchFunction switchFunctionInstance] GetInputName:[inputFields objectAtIndex:row] andProposalType:proposalType]];
            [cell.detailTextLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:aInputRecord.faceAmt]];
            return cell;
        }
        else
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inputCellIdentifier];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inputCellIdentifier] autorelease];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                [cell.textLabel setTextColor:[UIColor darkGrayColor]];
                [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
                [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
            }
            [cell.textLabel setText:[[switchFunction switchFunctionInstance] GetInputName:[inputFields objectAtIndex:row] andProposalType:proposalType]];
            if ([key isEqualToString:input_faceamt])
            {
                [cell.detailTextLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:aInputRecord.faceAmt]];
            }
            else if ([key isEqualToString:input_wprYear])
            {
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@年",aInputRecord.wprYear]];
            }
            else if ([key isEqualToString:input_wprType])
            {
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",aInputRecord.wprType]];
            }
            else if ([key isEqualToString:input_wprPlan])
            {
                [cell.detailTextLabel setText:aInputRecord.wprPlan];
            }
            else if ([key isEqualToString:input_socialInsurance])
            {
                [cell.detailTextLabel setText:aInputRecord.socialInsurance];
            }
            
            return cell;
        }
    }
    return nil;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec = [indexPath section];
    NSUInteger row = [indexPath row];
    if (sec == PlanSectionTypeSelect)
    {
        NSString *key = [selectFields objectAtIndex:row];
        if ([key isEqualToString:input_relation])
        {
            inputRelationViewController *inputRelationView = [[inputRelationViewController alloc] initWithNibName:@"inputRelationViewController" bundle:nil];
            [inputRelationView setCustomerArray:customerArray];
            [inputRelationView setClientId:aInputRecord.clientId];
            [inputRelationView setDelegate:self];
            [inputRelationView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:inputRelationView animated:YES completion:^{
                
            }];
            [inputRelationView release];
        }
        else if ([key isEqualToString:selectPlanCategory])
        {
            selectPlanCategoryViewController *categoryView = [[selectPlanCategoryViewController alloc] initWithNibName:@"selectPlanCategoryViewController" bundle:nil];
            [categoryView setDelegate:self];
            [categoryView setRowIndex:[aInputRecord.planCategory integerValue]];
            [categoryView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:categoryView animated:YES completion:^{
                
            }];
        }
        else if ([key isEqualToString:selectPlanTypeKey])
        {
            selectPlanTypeViewController *planTypeView = [[selectPlanTypeViewController alloc] initWithNibName:@"selectPlanTypeViewController" bundle:nil];
            [planTypeView setDelegate:self];
            [planTypeView setPlanType:aInputRecord.planType];
            [planTypeView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:planTypeView animated:YES completion:^{
            
            }];
        }
        else if ([key isEqualToString:selectPlanAbbrKey])
        {
            selectPlanAbbrViewController *planAbbrView = [[selectPlanAbbrViewController alloc] initWithNibName:@"selectPlanAbbrViewController" bundle:nil];
            [planAbbrView setDelegate:self];
            [planAbbrView setPlanCategory:[[switchFunction switchFunctionInstance] GetPlanCategoryNameWithIndex:[aInputRecord.planCategory integerValue]]];
            [planAbbrView setAbbrType:@"0"];
            [planAbbrView setPlanType:aInputRecord.planType];
            [planAbbrView setProjectType:0];
            [planAbbrView setProposalType:proposalType_lf];
            [planAbbrView setPlanAbbr:aInputRecord.planAbbr];
            [planAbbrView setRelation:aInputRecord.relation];
            [planAbbrView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:planAbbrView animated:YES completion:^{
                
            }];
        }
        else if ([key isEqualToString:selectPlanAidKey])
        {
            selectPlanAidViewController *planAidView = [[selectPlanAidViewController alloc] initWithNibName:@"selectPlanAidViewController" bundle:nil];
            [planAidView setDelegate:self];
            [planAidView setPlanAbbr:aInputRecord.planAbbr];
            [planAidView setPeriodOrder:aInputRecord.planOrder];
            [planAidView setPlanCodeOrder:aInputRecord.planCodeOrder];
            [planAidView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:planAidView animated:YES completion:^{
            
            }];
        }
    }
    else
    {
        NSString *key = [inputFields objectAtIndex:row];
        if ([key isEqualToString:input_faceamt])
        {
            inputNumberViewController *inputNumberView = [[inputNumberViewController alloc] initWithNibName:@"inputNumberViewController" bundle:nil];
            [inputNumberView setDelegate:self];
            [inputNumberView setUnitString:[[switchFunction switchFunctionInstance] GetFaceAmtUnit:[self.aPldf.unitValue integerValue] andFaceAmtType:self.aPldf.faceAmtType]];
            [inputNumberView setNumberType:inputNumberTypeInt];
            [inputNumberView setInputKey:key];
            [inputNumberView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
            [self presentViewController:inputNumberView animated:YES completion:^{}];
            [inputNumberView release];
        }
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentField = textField;
    [currentField retain];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    currentField = nil;
    [textField resignFirstResponder];
}

#pragma mark - NIDropdown Action
- (void)niDropDownDelegateMethod:(NIDropDown*)sender andIndexPath:(NSIndexPath *)indexPath
{
    NSString *planType = [planTypeArray objectAtIndex:[indexPath row]];
    [aInputRecord setPlanType:planType];
    //記憶體釋放
    [self rel];
}

-(void)rel
{
    [dropDown release];
    dropDown = nil;
}

#pragma mark - selectPlanHeaderAction
- (void)didPressSearchButton
{
    selectPlanCodeViewController *selectPlanCodeView = [[selectPlanCodeViewController alloc] initWithNibName:@"selectPlanCodeViewController" bundle:nil];
    [selectPlanCodeView setDelegate:self];
    [selectPlanCodeView setRelation:aInputRecord.relation];
    //取出對象對應的客戶資料
    NSString *str = [NSString stringWithFormat:@"relation = '%@'", aInputRecord.relation];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:str];
    NSArray *tmpArray = [customerArray filteredArrayUsingPredicate:predicate];
    if ([tmpArray count] > 0)
    {
        customerInfo *aCuatomer = [tmpArray objectAtIndex:0];
        [selectPlanCodeView setACustomer:aCuatomer];
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:selectPlanCodeView];
    nav.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
    [nav setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:nav animated:YES completion:^{
    
    }];
    
    [selectPlanCodeView release];
    [nav release];
}

#pragma mark - selectPlanCategory
- (void)didSelectPlanCategory:(NSInteger)index
{
    if ([aInputRecord.planCategory integerValue] != index)
    {
        //重新設定欄位
        [selectFields removeAllObjects];
        [selectFields addObject:input_relation];
        [selectFields addObject:selectPlanCategory];
        [selectFields addObject:selectPlanTypeKey];
        [selectFields addObject:selectPlanAbbrKey];
        //重新設定值
        aInputRecord.planCategory = [NSNumber numberWithInteger:index];
        [aInputRecord setPlanAbbr:@""];
        [aInputRecord setPlanAbbrDesc:@""];
        [aInputRecord setPlanOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanOrderDesc:@""];
        [aInputRecord setPlanCodeOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanCodeOrderDesc:@""];
        self.aPldf = nil;
        [self resetInputFields];
        [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - selectPlanTypeAction
- (void)didSelectPlanType:(NSString *)planType
{
    if (![planType isEqualToString:aInputRecord.planType])
    {
        //重新設定欄位
        [selectFields removeAllObjects];
        [selectFields addObject:input_relation];
        [selectFields addObject:selectPlanCategory];
        [selectFields addObject:selectPlanTypeKey];
        [selectFields addObject:selectPlanAbbrKey];
        //設定值
        [aInputRecord setPlanType:planType];
        [aInputRecord setPlanAbbr:@""];
        [aInputRecord setPlanAbbrDesc:@""];
        [aInputRecord setPlanOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanOrderDesc:@""];
        [aInputRecord setPlanCodeOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanCodeOrderDesc:@""];
        self.aPldf = nil;
        [self resetInputFields];
        [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - selectPlanAction
- (void)didSelectPlanAbbrWithPlanAbbrCode:(NSString *)planAbbr andPlanAbbrDesc:(NSString *)planAbbrDesc
{
    if (![planAbbr isEqualToString:aInputRecord.planAbbr])
    {
        //重新設定欄位
        [selectFields removeAllObjects];
        [selectFields addObject:input_relation];
        [selectFields addObject:selectPlanCategory];
        [selectFields addObject:selectPlanTypeKey];
        [selectFields addObject:selectPlanAbbrKey];
        [selectFields addObject:selectPlanAidKey];
        //設定值
        [aInputRecord setPlanAbbr:planAbbr];
        [aInputRecord setPlanAbbrDesc:planAbbrDesc];
        [aInputRecord setPlanOrderDesc:@""];
        [aInputRecord setPlanOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanCodeOrderDesc:@""];
        [aInputRecord setPlanCodeOrder:[NSNumber numberWithInteger:-1]];
        self.aPldf = nil;
        [self resetInputFields];
        [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - selectPlanOrderAction
- (void)didSelectPlanOrderWithPeriod:(NSNumber *)period andPeriodDesc:(NSString *)periodDesc andPlanCodeOrder:(NSNumber *)planCodeOrder andPlanCodeDesc:(NSString *)planCodeDesc andIPlanCode:(NSString *)iPlanCode andSplanCode:(NSString *)sPlanCode andCPlanCode:(NSString *)cPlanCode
{
    if (![period isEqualToNumber:aInputRecord.planOrder] || ![planCodeOrder isEqualToNumber:aInputRecord.planCodeOrder])
    {
        //重新設定欄位
        [selectFields removeAllObjects];
        [selectFields addObject:input_relation];
        [selectFields addObject:selectPlanCategory];
        [selectFields addObject:selectPlanTypeKey];
        [selectFields addObject:selectPlanAbbrKey];
        [selectFields addObject:selectPlanAidKey];
        //設定值
        [aInputRecord setPlanOrder:period];
        [aInputRecord setPlanOrderDesc:periodDesc];
        [aInputRecord setPlanCodeOrder:planCodeOrder];
        [aInputRecord setPlanCodeOrderDesc:planCodeDesc];
        [aInputRecord setIplanCode:iPlanCode];
        [aInputRecord setSplanCode:sPlanCode];
        [aInputRecord setCplanCode:cPlanCode];
        //載入pldf
        self.aPldf = [[DatabaseAccess databaseAccessInstance] getPldfWithPlanCode:aInputRecord.IplanCode andProposalType:proposalType];
        [self resetInputFields];
        [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - selectPlanCodeAction
- (void)didSelectPlanAidRecord:(planAid *)aid
{
    [selectFields removeAllObjects];
    [selectFields addObject:input_relation];
    [selectFields addObject:selectPlanCategory];
    [selectFields addObject:selectPlanTypeKey];
    [selectFields addObject:selectPlanAbbrKey];
    [selectFields addObject:selectPlanAidKey];
    
    aInputRecord.planType = aid.planType;
    aInputRecord.planAbbr = aid.planAbbrCode;
    aInputRecord.planAbbrDesc = aid.planAbbrDesc;
    aInputRecord.planOrder = aid.periodOrder;
    aInputRecord.planOrderDesc = aid.periodDesc;
    aInputRecord.planCodeOrder = aid.planCodeOrder;
    aInputRecord.planCodeOrderDesc = aid.planCodeDesc;
    aInputRecord.IplanCode = aid.IPlanCode;
    aInputRecord.SplanCode = aid.SPlanCode;
    aInputRecord.CplanCode = aid.CPlanCode;
    self.aPldf = [[DatabaseAccess databaseAccessInstance] getPldfWithPlanCode:aInputRecord.IplanCode andProposalType:proposalType];
    [self resetInputFields];
    [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - inputNumber
- (void)inputNumberView:(inputNumberViewController *)view didFinishEnterNumer:(NSNumber *)number andInputKey:(NSString *)key
{
    if ([key isEqualToString:input_faceamt])
    {
        aInputRecord.faceAmt = number;
    }
    [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - inputRelation

- (void)didSelectRelationWithClientId:(NSString *)clientId andRelation:(NSString *)relation andRelationName:(NSString *)renationName
{
    if (![aInputRecord.clientId isEqualToString:clientId])
    {
        [selectFields removeAllObjects];
        [selectFields addObject:input_relation];
        [selectFields addObject:selectPlanCategory];
        [selectFields addObject:selectPlanTypeKey];
        [aInputRecord setClientId:aInputRecord.clientId];
        [aInputRecord setRelation:relation];
        [aInputRecord setPlanAbbr:@""];
        [aInputRecord setPlanAbbrDesc:@""];
        [aInputRecord setPlanOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanOrderDesc:@""];
        [aInputRecord setPlanCodeOrder:[NSNumber numberWithInteger:-1]];
        [aInputRecord setPlanCodeOrderDesc:@""];
        self.aPldf = nil;
        [self resetInputFields];
    }
    [aTableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - user define function
- (void)createBarItem
{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"加入" style:UIBarButtonItemStylePlain target:self action:@selector(addPlanItem)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addItem, nil];
    [addItem release];
}

- (void)addPlanItem
{
    [infoPanel showPanelInView:self.view type:infoPanelTypeInfo title:@"狀態" subTitle:@"險種已新增成功，請繼續。" hideAfter:2];
}

#pragma mark - 重新設定輸入欄位
- (void)resetInputFields
{
    [inputFields removeAllObjects];
    [inputFields addObject:input_faceamt];
    if ([self.aPldf.wpInd isEqualToString:@"0"] && [self.aPldf.primaryRiderInd isEqualToString:@"P"])
    {
        [inputFields addObject:input_wprType];
        [inputFields addObject:input_wprYear];
        [inputFields addObject:input_wprPlan];
    }
    if ([self.aPldf.rateInsuInd isEqualToString:@"1"])
    {
        [inputFields addObject:input_socialInsurance];
    }
}

#pragma mark - 為keyboard建立關閉的toolbar
- (void)createToolBarForKeyBoard:(UITextField*)field
{
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"確定" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard:)];
    [item setTag:0];
    [toolBar setItems:[NSArray arrayWithObjects:flexItem, item, nil]];
    [field setInputAccessoryView:toolBar];
    [item release];
    [toolBar release];
}

- (void)dismissKeyboard:(UIBarButtonItem*)item
{
    [currentField resignFirstResponder];
}

#pragma mark - 點擊費率查詢按鈕
- (void)queryPratButtonPress:(UIButton*)sender
{
    pratTableViewController *pratView = [[pratTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pratView];
    [nav setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:nav animated:YES completion:nil];
}



@end
