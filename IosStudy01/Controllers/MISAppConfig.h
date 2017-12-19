//
//  MISAppConfig.h
//  microschool
//
//  Created by Eduapp on 13-5-21.
//  Copyright (c) 2013年 Eduapp. All rights reserved.
//

#ifndef microschool_MISAppConfig_h
#define microschool_MISAppConfig_h

#import<Foundation/Foundation.h>


#define OPEN_LOG 0

/*
 *  0:正式环境 1:测试环境
 */
#define MIS_DEBUG 0

#define Aveg_Duration @"aveg_duration" //平均用时
#define Aveg_Efficiency @"aveg_efficiency" //平均效率
#define Aveg_Calories @"aveg_calories" //平均消耗
#define Aveg_HeartRate @"aveg_heart_rate" //平均心率
#define Aveg_Effect @"aveg_effect" //训练效果

#define LoadingPromptText @"加载中..."

#define Aveg_Duration @"aveg_duration" //平均用时

#define MISMethodKindAll  @"全部"
#define MISMethodKindTraining @"训练"
#define MISMethodKindCustom @"自建"
#define MISMethodKindEvaluating   @"评估"
#define MISMethodKindWarmUp  @"热身"
#define MISMethodKindProgressive @"递进"
#define MISMethodKindApplication @"应用"
#define MISMethodKindRelax   @"放松"

//当前盒子连接的序号
#define CURRENTSECTION_KEY   @"currentSection"

#define CURSOR_INFRARED_DISTANCE  70
#define CURSOR_TOUCH_STRENGTH  2
#define CURSOR_BRIGHTNESS  100
#define METHOD_MODE_SEQ 0         //顺序训练
#define METHOD_MODE_RANDOM 1      //随机训练
#define METHOD_MODE_RANDOM_SEQ 4  //随机训练 & 顺序训练

#define RECEIVE_DELAY_TIME_MILLIS (10 * 1000) //心率收集的延时时间(毫秒)



#define  VERSION_NUMBER [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

// 只要添加了这个宏，就不用带mas_前缀
#define MAS_SHORTHAND
// 只要添加了这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS
// 这个头文件一定要放在上面两个宏的后面

//-------------------自动布局宏定义-------------------------
#define MAS_PADDING   10

//weak & strong self
#define MIS_WS                  __weak __typeof(&*self)weakSelf     = self;
#define MIS_SS(WKSELF)          __strong __typeof(&*self)strongSelf = WKSELF;
#define MIS_ONE_PX              (1.0f / [UIScreen mainScreen].scale)

#define MIS_SAFE_OBJ(__OBJ) ((__OBJ) == nil ? @"": (__OBJ))
#define MIS_SAFE_INT_OBJ(__OBJ) ((__OBJ) > 0  ? (__OBJ) :  0)
#define MIS_SAFE_ARRAYOBJ(__OBJ) ((__OBJ) == nil ? @[]: (__OBJ))


//-------------------获取设备大小-------------------------
//NavBar高度
#define NavigationBar_HEIGHT 44.0f
//TabBar高度
#define TabBar_HEIGHT 49.0f
//StatusBar高度
#define StatusBar_HEIGHT 20.0f
//ToolsBar高度
#define ToolsBar_HEIGHT 44.0f
//1个像素大小
#define MIS_ONE_PX (1.0f / [UIScreen mainScreen].scale)

//keyWindow
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow



//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define VIEW_HEIGHT (SCREEN_HEIGHT - StatusBar_HEIGHT - NavigationBar_HEIGHT)
#define VIEW_WIDTH SCREEN_WIDTH

//设置View的tag属性
#define VIEWWITHTAG(_OBJECT, _TAG) [_OBJECT viewWithTag : _TAG]

//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian * 180.0)/(M_PI)

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define VIEW_BGCOLOR RGB(247.0f, 247.0f, 247.0f)


//论坛高亮蓝色
#define FORUM_BLUE_COLOR RGB(40.0f, 77.0f, 134.0f)

//半透明背景
#define VIEW_ALPHA_BGCOLOR  [UIColor colorWithWhite:0.5 alpha:0.5]

//清除背景色
#define CLEAR_COLOR [UIColor clearColor] //clear color
#define BLACK_COLOR [UIColor blackColor] //black color
#define WHITE_COLOR [UIColor whiteColor] //white color
#define GRAY_COLOR  [UIColor grayColor]  //grayColor color

#define BUTTON_BLUE_COLOR  [UIColor colorWithRed:0.09 green:0.53 blue:1 alpha:1]
//字体
#define NFont(__SIZE) [UIFont systemFontOfSize:__SIZE] //system font with size
#define IFont(__SIZE) [UIFont italicSystemFontOfSize:__SIZE] //system font with size
#define BFont(__SIZE) [UIFont boldSystemFontOfSize:__SIZE]//system bold font with size
#define Font(__NAME, __SIZE) [UIFont fontWithName:__NAME size:__SIZE] //font with name and size

//注册/移除 通知中心
#define POST_NOTIFY(__NAME, __OBJ, __INFO) [[NSNotificationCenter defaultCenter] postNotificationName:__NAME object:__OBJ userInfo:__INFO];
#define LISTEN_NOTIFY(__NAME, __OBSERVER, __SELECTER)    [[NSNotificationCenter defaultCenter] addObserver:__OBSERVER selector:__SELECTER name:__NAME object:nil];//listen notification
#define REMOVE_NOTIFY(__OBSERVER) 	[[NSNotificationCenter defaultCenter] removeObserver:__OBSERVER]; //remove listen Observer

//读取本地图片
#define IMAGE_WITH_FILE(_NAME,_EXT) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:_NAME ofType:_EXT]]
#define IMAGE_WITH_NAME(_NAME) [UIImage imageNamed:_NAME]
#define IMAGE_WITH_RGB(__RGB) [UIImage imageWithColor:UIColorFromRGB(__RGB)]

#define STRETCHABLE_IMG_WITH(__NAME, __LEFTCAP, __TOPCAP)[IMAGE_WITH_NAME(__NAME) stretchableImageWithLeftCapWidth:__LEFTCAP topCapHeight:__TOPCAP]
#define STRETCHABLE_IMG(__NAME)[IMAGE_WITH_NAME(__NAME) stretchableImageWithLeftCapWidth:nearbyintf(IMAGE_WITH_NAME(__NAME).size.width / 2.0) topCapHeight:nearbyintf(IMAGE_WITH_NAME(__NAME).size.height / 2.0)]

//FMDB读表
#define STRVALUE(__SET, __NAME)       [(__SET) stringForColumn:(__NAME)]
#define DATETIMEVALUE(__SET, __NAME)  [(__SET) dateForColumn:(__NAME)]
#define INT8VALUE(__SET, __NAME)      [(__SET) intForColumn:(__NAME)]
#define INT16VALUE(__SET, __NAME)     [(__SET) intForColumn:(__NAME)]
#define INT32VALUE(__SET, __NAME)     [(__SET) intForColumn:(__NAME)]
#define INT64VALUE(__SET, __NAME)     [(__SET) longLongIntForColumn:(__NAME)]
#define DOUBLEVALUE(__SET, __NAME)    [(__SET) doubleForColumn:(__NAME)]

#if OPEN_LOG
#define MISLog(...)             NSLog(__VA_ARGS__);
#define MISLogFunc              MISLog(@"%s", __FUNCTION__);
#define MISLogLine              MISLog(@"Line:%d", __LINE__);
#define MISLogFile              MISLog(@"%s", __FILE__);
#define MISLogError(__ERROR)    MISLog(@"%s, Error:%@", __FUNCTION__, __ERROR);
#define NSSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
#define MISLog(...)             {}
#define MISLogFunc              {}
#define MISLogLine              {}
#define MISLogFile              {}
#define MISLogError(__ERROR)    {}
#define NSSLog(FORMAT, ...)     {}
#endif

//calc run time

#define MIS_CALC_TIME_BEGIN                                            \
printf("******Calc In Fun:%s******\n", __FUNCTION__);              \
printf("================Line:[%d]==================\n", __LINE__); \
double begin = CFAbsoluteTimeGetCurrent();

#define MIS_CALC_TIME_END                                              \
printf("Run Duration:[%f]\n", CFAbsoluteTimeGetCurrent() - begin); \
printf("================Line:[%d]==================\n", __LINE__);

#define MIS_PAGE_MARGIN 15.0f

#endif
