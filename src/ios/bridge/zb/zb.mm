//
//  Zb.mm
//  ZBridge
//
//  Created by  on 12/02/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#include "zb.h"
#include "view.h"

using namespace v8;

bool zb::Zb::Run(NSString *s)
{
    HandleScope handle_scope;
    
    v8::Handle<v8::ObjectTemplate> global = v8::ObjectTemplate::New();                                                                                                  
    zb::View::InitializeTemplate(global);
    
    global->Set(v8::String::New("Log"), v8::FunctionTemplate::New(Zb::Log));
    Handle<Context> context = v8::Context::New(NULL, global);
    
    Context::Scope context_scope(context); 
    Handle<String> source = String::New((char *) [s UTF8String]);
    Handle<Script> script = Script::Compile(source);
    Handle<Value> result = script->Run(); 
    String::AsciiValue ascii(result);
    return true;
}

v8::Handle<v8::Value> zb::Zb::Log(const v8::Arguments &args)
{
    v8::Local<v8::Object> thisObject = args.This();
    if (args.Length() > 0) {
        NSLog(@"%s", *v8::String::Utf8Value(args[0]));
    }
    return thisObject;
}