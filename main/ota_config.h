#ifndef OTA_CONFIG_H
#define OTA_CONFIG_H

#define WIFI_SSID        "OTA_TEST_NETWORK"
#define WIFI_PASS        "OTA_PASSWORD"

/* Manifest URL should return JSON like:
   { "version": "1.0.1", "url": "https://server/firmware.bin", "sha256": "..." } */
#define MANIFEST_URL     "https://192.168.101.2:1501/manifest.json"

/* Current firmware version string. Update before building release. */
#define CURRENT_FW_VERSION "1.0.0"

/* OTA settings */
#define OTA_TASK_STACK_SZ 8192
#define OTA_TASK_PRIORITY 5

#endif /* OTA_CONFIG_H */
