package com.apportable.demo;

import android.content.ContentResolver;
import android.provider.Settings;
import android.util.Log;

public class SettingsSystemUtil {
    private static final String TAG = "SettingsSystemUtil";

    public SettingsSystemUtil() { }

    public static String getAccelerometerRotation(ContentResolver resolver) {
        return Settings.System.getString(resolver, Settings.System.ACCELEROMETER_ROTATION);
    }
}
