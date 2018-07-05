LOCAL_PATH := $(call my-dir)

#给小微app使用
-include ${LOCAL_PATH}/xiaowei_app_sdk.conf

include $(CLEAR_VARS)
LOCAL_MODULE := libxiaoweiSDK
LOCAL_SRC_FILES :=../../../../DeviceSDK/release/Android/$(TARGET_ARCH_ABI)/libxiaoweiSDK.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE   := xiaowei
LOCAL_SRC_FILES := XWSDK.cpp
LOCAL_SRC_FILES += Device.cpp
LOCAL_SRC_FILES += BinderList.cpp
LOCAL_SRC_FILES += FileTransfer.cpp
LOCAL_SRC_FILES += WifiDecoder.cpp
LOCAL_SRC_FILES += OTA.cpp
LOCAL_SRC_FILES += QCloudAudio.cpp
LOCAL_SRC_FILES += Util.cpp
LOCAL_SRC_FILES += base64.cpp
LOCAL_SRC_FILES += QQCall.cpp

LOCAL_C_INCLUDES := $(NDK)/sources/cxx-stl/stlport/stlport/
LOCAL_C_INCLUDES += $(NDK)/sources/android/support/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../../DeviceSDK/interface/android
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../../DeviceSDK/interface/linux

ifeq ($(ENABLEVOICELINK),no)
    LOCAL_CFLAGS+=-DNO_VOICELINK
    LOCAL_CXXFLAGS+=-DNO_VOICELINK
endif

ifeq ($(ENABLEFILETRANSFER),no)
    LOCAL_CFLAGS+=-DNO_FILE_TRANSFER
    LOCAL_CXXFLAGS+=-DNO_FILE_TRANSFER
endif

ifeq ($(ENABLEOTA),no)
	ADD_CFLAGS+=-DNO_OTA
	ADD_CXXFLAGS+=-DNO_OTA
endif

ifeq ($(ENABLEFRIEND),no)
	ADD_CFLAGS+=-DNO_FRIEND
	ADD_CXXFLAGS+=-DNO_FRIEND
endif

LOCAL_CPP_FEATURES := rtti

LOCAL_LDFLAGS +=$(LOCAL_PATH)/../../../../DeviceSDK/release/Android/$(TARGET_ARCH_ABI)/libxiaoweiSDK.so

LOCAL_LDFLAGS += -llog

include $(BUILD_SHARED_LIBRARY)
