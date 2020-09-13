/*
 * Copyright (c) 2017-2020 Felipe de Leon <fglfgl27@gmail.com>
 *
 * This file is part of SysInfoService <https://github.com/fgl27/device_motorola_quark>
 *
 */

package com.sysinfo;

public final class Constants {

    //Common paths
    final static String CPU_ROOT = "/sys/devices/system/cpu/cpu";
    final static String CPU_CUR_TAIL = "/cpufreq/scaling_cur_freq";
    final static String CPU_UTI_TAIL = "/cpufreq/cpu_utilization";
    final static String CPU_GOV_TAIL = "/cpufreq/scaling_governor";
    final static String BATTERY_PARAMETERS = "/sys/class/power_supply/battery";
    final static String BAT_VOLTS = BATTERY_PARAMETERS + "/voltage_now";
    final static String BAT_CAPACITY = BATTERY_PARAMETERS + "/capacity";
    final static String BAT_AMP = BATTERY_PARAMETERS + "/current_avg";
    final static String BAT_TEMP = BATTERY_PARAMETERS + "/temp";
    final static String THERMAL_ZONE = "/sys/class/thermal/thermal_zone"; //apq8084 zones bat=0, cpu_soq=1, core0-3=6-9, gpu=10
    //Bellow are the apq8084/quark path others devices may be different path all together or just the end eg qcom,cpubw.**
    final static String GPU_FREQ = "/sys/devices/fdb00000.qcom,kgsl-3d0/kgsl/kgsl-3d0/gpuclk";
    final static String GPU_GOV = "/sys/class/kgsl/kgsl-3d0/devfreq/governor";
    final static String GPU_BUSY = "/sys/class/kgsl/kgsl-3d0/gpubusy";
    final static String RAM_CUR_FREQ = "/sys/class/devfreq/qcom,cpubw.35/cur_freq";
    final static String RAM_GOV = "/sys/class/devfreq/qcom,cpubw.35/governor";

    //The preferences from settings_options.xml
    final static String SWITCH_SERVICE_POSITION = "service_position";
    final static String SWITCH_SERVICE_ENABLE = "service_enable";
    final static String SWITCH_SERVICE_BACKGROUND = "service_background";

    //Service actions
    final static String ACTION_UPDATE_POSITION = "update_position";
    final static String ACTION_UPDATE_BACKGROUND = "update_background";
}
