//
//  DataProvider.h
//  IosStudy01
//
//  Created by Ding on 2018/6/19.
//  Copyright © 2018 ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataProvider : NSObject

+(DataProvider *) provider;

-(NSArray *) getMessageArray;

@end
