//
//  AICustomButtonHeader.h
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#ifndef AICustomButtonHeader_h
#define AICustomButtonHeader_h

typedef NS_ENUM(int, SFCustomStatus) {
    SFCustomStatus_Normal       = 0,
    ///不可用
    SFCustomStatus_Disabled     = 1,
    ///选中
    SFCustomStatus_Selected     = 2,
    ///高亮
    SFCustomStatus_Highlighted  = 3,
};

#endif /* AICustomButtonHeader_h */
