//
//  view.h
//  zb
//
//  Created by  on 12/02/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "v8.h"
#include "v8stdint.h"

namespace zb {
    class View {
    public:
        static v8::Handle<v8::Value> New(const v8::Arguments &args);
        static void Dispose(v8::Persistent<v8::Value> handle, void* parameter);
        static void InitializeTemplate(v8::Handle<v8::ObjectTemplate> global);
        static v8::Handle<v8::Value> GetAlpha(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info);
        static void SetAlpha(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info);
        static v8::Handle<v8::Value> GetX(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info);
        static void SetX(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info);
        static v8::Handle<v8::Value> GetY(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info);
        static void SetY(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info);
    };
}

