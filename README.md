# ESP32 OTA Project (Fresher — Resume Project)

Production-oriented OTA example for ESP32 using ESP-IDF.

Features
- HTTPS pull OTA with manifest-based version check.
- Dual OTA partitions + otadata for safe rollback.
- CA certificate embedded in the binary (EMBED_TXTFILES).
- App-side confirmation to prevent rollback.
- Basic retry/backoff and progress logging.

Prerequisites
- ESP-IDF v4.4 or later (recommended latest stable).
- Python, toolchain and IDF environment set up: https://docs.espressif.com/
- A TLS-enabled server hosting:
  - `manifest.json` (JSON with `version`, `url`, `sha256`)
  - the firmware binary referenced by `url`

Quick start
1. Edit `main/ota_config.h` to set `WIFI_SSID`, `WIFI_PASS`, and `MANIFEST_URL`.
2. Replace `certs/server_cert.pem` with your CA PEM (or use system CA).
3. Build & flash:
   ```bash
   idf.py set-target esp32
   idf.py build
   idf.py -p /dev/ttyUSB0 flash monitor
Initial commit: project skeleton -- 2025-11-14T13:30:01
