LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../lua
LOCAL_MODULE     := luajava
LOCAL_SRC_FILES  := luajava.c
LOCAL_STATIC_LIBRARIES := liblua
# LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
