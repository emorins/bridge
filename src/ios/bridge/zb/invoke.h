//
//  script.h
//  zb
//
//  Created by  on 12/02/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#include "v8.h"
#include "v8stdint.h"

namespace zb {
    class Invoke {
    public:
        static bool Run(NSString *script);
        static v8::Handle<v8::Value> Plus(const v8::Arguments& args);
        static v8::Local<v8::Value> hoge_Constructor(const v8::Arguments& args);
        static v8::Handle<v8::Value> Print(const v8::Arguments& args);
    };
    
}
