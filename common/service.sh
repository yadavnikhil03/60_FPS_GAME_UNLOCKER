#!/system/bin/sh
MODDIR=${0%/*}

# Monitor GPU performance and adjust settings after boot
while true; do
  # Check if any version of PUBG or BGMI is running and boost performance
  if pgrep "com.tencent.ig" > /dev/null || pgrep "com.pubg.imobile" > /dev/null; then
    # Apply high-performance GPU settings
    echo "Applying high-performance GPU settings..."

    # Performance tuning for CPU and GPU
    chown system system /sys/devices/system/cpu/*/*/*
    chown system system /sys/module/msm_performance/parameters/touchboost
    chown system system /sys/devices/soc/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor
    chown system system /sys/class/*/*/*/*
    chown system system /sys/module/*/*/*
    
    # CPU performance settings
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor performance
    write /sys/devices/system/cpu/cpufreq/performance/go_hispeed_load 75
    write /sys/devices/system/cpu/cpufreq/performance/above_hispeed_delay 0
    write /sys/devices/system/cpu/cpufreq/performance/boost 1
    write /sys/module/msm_performance/parameters/touchboost 1
    write /sys/devices/system/cpu/cpufreq/performance/max_freq_hysteresis 1
    write /sys/devices/system/cpu/cpufreq/performance/align_windows 1
    
    # GPU performance settings
    write /sys/devices/soc/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor performance
    write /sys/class/kgsl/kgsl-3d0/devfreq/governor msm-adreno-tz
    write /sys/class/kgsl/kgsl-3d0/devfreq/adrenoboost 3
    write /sys/module/adreno_idler/parameters/adreno_idler_active 0
    write /sys/module/lazyplug/parameters/nr_possible_cores 8
    write /dev/cpuset/foreground/cpus 0-3,4-7
    write /dev/cpuset/foreground/boost/cpus 4-7
    write /dev/cpuset/top-app/cpus 0-7
    write /sys/class/kgsl/kgsl-3d0/throttling 0
  fi
  
  sleep 60  # Check every 60 seconds
done
