//
//  Zb.h
//  ZBridge
//
//  Created by  on 12/02/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#include "v8.h"
#include "v8stdint.h"
#include "invoke.h"

namespace zb {
    class Zb {
    public:
        static bool Run(NSString *s);
        static v8::Handle<v8::Value> Log(const v8::Arguments& args);
    };
}
