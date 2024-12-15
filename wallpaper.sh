#!/usr/bin/bash

# Pastikan variabel DISPLAY dan DBUS_SESSION_BUS_ADDRESS diatur
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Fungsi untuk mengubah wallpaper
ganti_wallpaper() {
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP1/workspace0/last-image --set "$1"
}

# Mendapatkan jam saat ini (format 24 jam)
current_time=$(date +%H:%M)

# Log untuk debugging
log_file="/home/masrebo/wallpaper/cron_debug.log"
echo "Script dijalankan pada: $(date)" >> "$log_file"

# Penentuan waktu berdasarkan range jam
if [[ "$current_time" > "05:00" && "$current_time" < "12:00" ]]; then
    ganti_wallpaper "/home/masrebo/wallpaper/pagi.jpg"
    echo "Wallpaper diatur ke Waktu Pagi" >> "$log_file"
    echo "" >> "$log_file"
elif [[ "$current_time" > "12:00" && "$current_time" < "18:00" ]]; then
    ganti_wallpaper "/home/masrebo/wallpaper/siang.jpg"
    echo "Wallpaper diatur ke Waktu Siang" >> "$log_file"
    echo "" >> "$log_file"
elif [[ "$current_time" > "18:00" && "$current_time" < "18:31" ]]; then
    ganti_wallpaper "/home/masrebo/wallpaper/magrib.jpg"
    echo "Wallpaper diatur ke Waktu Magrib" >> "$log_file"
    echo "" >> "$log_file"
else
    ganti_wallpaper "/home/masrebo/wallpaper/malam.jpg"
    echo "Wallpaper diatur ke Waktu Malam" >> "$log_file"
    echo "" >> "$log_file"
fi
