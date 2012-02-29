//
//  view.mm
//  zb
//
//  Created by  on 12/02/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#include "view.h"

using namespace v8;

v8::Handle<v8::Value> zb::View::New(const v8::Arguments &args)
{
    UIView* view = [[UIView alloc] init];
    
    v8::Local<v8::Object> thisObject = args.This();
    thisObject->SetInternalField(0, v8::External::New((__bridge_retained void *)view));
    v8::Persistent<v8::Object> holder = v8::Persistent<v8::Object>::New(thisObject);
    holder.MakeWeak((__bridge void *)view, zb::View::Dispose);
    
    return thisObject;
}

void zb::View::Dispose(v8::Persistent<v8::Value> handle, void* parameter)
{
    __unused UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)parameter);
    handle.Dispose();
}

void zb::View::InitializeTemplate(v8::Handle<v8::ObjectTemplate> global)
{
    v8::Local<v8::FunctionTemplate> klass = v8::FunctionTemplate::New(View::New);
    klass->SetClassName(v8::String::New("View"));
    
    v8::Local<v8::ObjectTemplate> instTemplate = klass->InstanceTemplate();
    instTemplate->SetInternalFieldCount(1);
    instTemplate->SetAccessor(v8::String::New("count"), View::GetAlpha, View::SetAlpha);
    
    v8::Local<v8::ObjectTemplate> protoTemplate = klass->PrototypeTemplate();
    //protoTemplate->Set(v8::String::New("add"), v8::FunctionTemplate::New(CounterJSIF::Add));
    
    global->Set(v8::String::New("View"), klass);
}

v8::Handle<v8::Value> zb::View::GetAlpha(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    return v8::Integer::New(view.alpha);
}

void zb::View::SetAlpha(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    view.alpha = value->Int32Value();
}

v8::Handle<v8::Value> zb::View::GetX(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    return v8::Integer::New(view.frame.origin.x);
}

void zb::View::SetX(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    view.frame = CGRectMake(value->Int32Value(), view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}

v8::Handle<v8::Value> zb::View::GetY(v8::Local<v8::String> propertyName, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    return v8::Integer::New(view.frame.origin.y);
}

void zb::View::SetY(v8::Local<v8::String> propertyName, v8::Local<v8::Value> value, const v8::AccessorInfo& info)
{
    void *pThis = v8::Local<v8::External>::Cast(info.Holder()->GetInternalField(0))->Value();
    const UIView *view = static_cast<UIView *>((__bridge_transfer UIView *)pThis);
    view.frame = CGRectMake(view.frame.origin.x, value->Int32Value(), view.frame.size.width, view.frame.size.height);
}





