//
//  Zb.cpp
//  ZBridge
//
//  Created by  on 12/02/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#include "invoke.h"
#include "view.h"

using namespace v8;

v8::Handle<v8::Value> zb::Invoke::Plus(const v8::Arguments& args)
{ 
    unsigned int A = args[0]->Uint32Value();
    unsigned int B = args[1]->Uint32Value();
    return Integer::New(A +  B);
}

v8::Handle<v8::Value> zb::Invoke::Print(const v8::Arguments& args) {
    bool first = true;
    for (int i = 0; i < args.Length(); i++) {
        v8::HandleScope handle_scope;
        if (first) {
            first = false;
        } else {
            printf(" ");
        }
        v8::String::Utf8Value str(args[i]);
    }
    NSLog(@"=----");
    fflush(stdout);
    //return v8::Undefined();
    return v8::String::New("x");
}