/*
 * Tencent is pleased to support the open source community by making  XiaoweiSDK Demo Codes available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company. All rights reserved.
 *
 * Licensed under the MIT License (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://opensource.org/licenses/MIT
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 *
 */
package com.tencent.aiaudio.activity;

import com.tencent.xiaowei.def.XWCommonDef;
import com.tencent.xiaowei.sdk.XWSDK;

public class FMActivity extends MusicActivity {

    private static int lastSessionId = -1;

    protected int getLastSessionId() {
        return lastSessionId;
    }

    protected void setLastSessionId(int sessionId) {
        lastSessionId = sessionId;
    }

    protected void playFavorite() {
        XWSDK.getInstance().request(XWCommonDef.RequestType.TEXT, "播放我收藏的故事".getBytes());
    }
}
