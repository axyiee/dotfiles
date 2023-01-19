/**
 * Firefox user configuration index file.
 * Hardening/privacy and styling configuration.
 */

// Make sure to apply the following configuration and extensions:
// [+] Extensions
//     - [...] uBlock Origin
//             - Set up a blocking mode: https://github.com/gorhill/uBlock/wiki/Blocking-mode
//             - > Filter lists > AdGuard URL Tracking Protection [ON]
//             - > Filter lists > Custom > Import > https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt
//     - [...] Dark Reader
//             - Settings > Detect dark theme [ON]
//     - Skip Redirect
// [+] Firefox Built-in Settings
//     - [|] ☰ Settings > Privacy & Security
//           - Enhanced Tracking Protection: Strict
//           - Cookies and Site Data: Delete cookies and site data when Firefox is closed
//             (you can also add exceptions for sites you want to keep cookies for)
//           - HTTPS-Only Mode: Always

// Allow custom theming on Firefox
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("layout.css.color-mix.enabled", true);
user_pref("layout.css.has-selector.enabled", true);

// [start] WaveFox-specific configuration
user_pref("userChrome.ProtonTabs-Enabled", true); // Enable Proton tabs
user_pref("userChrome.FilledMenuIcons-Enabled", true); // Enable filled menu icons
user_pref("userChrome.OneLine-Enabled", true); // Enable one line tabs
// [end]   WaveFox-specific configuration

user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("geo.provider.use_gpsd", false);
user_pref("geo.provider.use_geoclue", false);
user_pref("browser.region.update.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);
user_pref("network.dns.disableIPv6", true);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.file.disable_unc_paths", true);
user_pref("network.gio.supported-protocols", "");
