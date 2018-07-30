/*
 * Copyright (c) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.lineageos.settings.device;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.util.Log;

public class FlatUpSensor implements ScreenStateNotifier {
    private static final String TAG = "LineageActions-FlatUpSensor";

    private final LineageActionsSettings mLineageActionsSettings;
    private final SensorHelper mSensorHelper;
    private final SensorAction mSensorAction;
    private final Sensor mFlatUpSensor;

    private boolean mEnabled;
    private boolean mLastFlatUp;

    public FlatUpSensor(LineageActionsSettings cmActionsSettings, SensorHelper sensorHelper,
        SensorAction action) {
        mLineageActionsSettings = cmActionsSettings;
        mSensorHelper = sensorHelper;
        mSensorAction = action;

        mFlatUpSensor = sensorHelper.getFlatUpSensor();
    }

    @Override
    public void screenTurnedOn() {
        if (mEnabled) {
            Log.d(TAG, "Disabling");
            mSensorHelper.unregisterListener(mFlatUpListener);
            mEnabled = false;
        }
    }

    @Override
    public void screenTurnedOff() {
        if (mLineageActionsSettings.isPickUpEnabled() && !mEnabled) {
            Log.d(TAG, "Enabling");
            mSensorHelper.registerListener(mFlatUpSensor, mFlatUpListener);
            mEnabled = true;
        }
    }

    private SensorEventListener mFlatUpListener = new SensorEventListener() {
        @Override
        public synchronized void onSensorChanged(SensorEvent event) {
            boolean thisFlatUp = (event.values[0] != 0);

            Log.d(TAG, "event: " + thisFlatUp + " mLastFlatUp=" + mLastFlatUp);

            if (mLastFlatUp && !thisFlatUp) {
                mSensorAction.action();
            }
            mLastFlatUp = thisFlatUp;
        }

        @Override
        public void onAccuracyChanged(Sensor mSensor, int accuracy) {}
    };
}