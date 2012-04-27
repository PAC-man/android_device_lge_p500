LOCAL_PATH := $(call my-dir)

####### LIBCAMERA #######

# When zero we link against libmmcamera; when 1, we dlopen libmmcamera.
DLOPEN_LIBMMCAMERA:=1
#
#include $(CLEAR_VARS)
#LOCAL_MODULE_TAGS := optional
#
#LOCAL_PRELINK_MODULE := false
#
#LOCAL_SRC_FILES:= QualcommCameraHardware.cpp
#
#LOCAL_CFLAGS:= -DDLOPEN_LIBMMCAMERA=$(DLOPEN_LIBMMCAMERA)
#
## Can be raised to 6 to improve framerate, at the cost of allocating
## more ADSP memory. Use 0xa68000 as pool size in kernel to test
#LOCAL_CFLAGS+= -DNUM_PREVIEW_BUFFERS=3 -D_ANDROID_
#
#LOCAL_C_INCLUDES+= \
#    $(TARGET_OUT_HEADERS)/mm-camera \
#    $(TARGET_OUT_HEADERS)/mm-still/jpeg \
#
#LOCAL_SHARED_LIBRARIES:= libutils libui libcamera_client liblog libcutils
#
#LOCAL_SHARED_LIBRARIES+= libbinder
#ifneq ($(DLOPEN_LIBMMCAMERA),1)
#LOCAL_SHARED_LIBRARIES+= liboemcamera
#else
#LOCAL_SHARED_LIBRARIES+= libdl
#endif

#LOCAL_MODULE:= libcamera
#include $(BUILD_SHARED_LIBRARY)

####### CAMERA.P500 #######
## Make camera wrapper

include $(CLEAR_VARS)

LOCAL_C_FLAGS        += -O3
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware libcamera

LOCAL_C_INCLUDES       := frameworks/base/services \
                          frameworks/base/include \
                          hardware/libhardware/include \
                          hardware/qcom/display/libgralloc

LOCAL_MODULE := camera.p500
include $(BUILD_SHARED_LIBRARY)