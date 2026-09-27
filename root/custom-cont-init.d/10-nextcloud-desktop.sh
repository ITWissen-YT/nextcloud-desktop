#!/usr/bin/with-contenv bash
set -e

mkdir -p /config/Desktop /config/.config/autostart /client-data

cat > /config/Desktop/Nextcloud.desktop <<'EOD'
[Desktop Entry]
Type=Application
Name=Nextcloud
Exec=nextcloud
Icon=Nextcloud
Terminal=false
Categories=Network;
EOD

cat > /config/Desktop/Files.desktop <<'EOD'
[Desktop Entry]
Type=Application
Name=Files
Exec=thunar /client-data
Icon=system-file-manager
Terminal=false
Categories=Utility;
EOD

cat > /config/Desktop/Firefox.desktop <<'EOD'
[Desktop Entry]
Type=Application
Name=Firefox
Exec=firefox-esr
Icon=firefox-esr
Terminal=false
Categories=Network;WebBrowser;
EOD

cat > /config/.config/autostart/nextcloud.desktop <<'EOD'
[Desktop Entry]
Type=Application
Name=Nextcloud
Exec=nextcloud
X-GNOME-Autostart-enabled=true
EOD

chmod +x /config/Desktop/*.desktop
chown -R ${PUID:-1000}:${PGID:-1000} /config/Desktop /config/.config /client-data 2>/dev/null || true
