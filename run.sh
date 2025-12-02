#!/bin/bash

POLICY_DIR="/etc/brave/policies/managed"
POLICY_FILE="$POLICY_DIR/GroupPolicy.json"

# Create policy directory if it doesn't exist
if [ ! -d "$POLICY_DIR" ]; then
  echo "Creating Brave policy directory at $POLICY_DIR"
  sudo mkdir -p "$POLICY_DIR"
fi

# Create policy JSON file with desired settings
echo "Writing Brave policy settings to $POLICY_FILE"
sudo tee "$POLICY_FILE" > /dev/null <<EOF
{
  "BraveRewardsDisabled": true,
  "BraveWalletDisabled": true,
  "BraveVPNDisabled": true,
  "BraveAIChatEnabled": false,
  "MetricsReportingEnabled": false,
  "SafeBrowsingExtendedReportingEnabled": false,
  "UrlKeyedAnonymizedDataCollectionEnabled": false,
  "FeedbackSurveysEnabled": false,
  "PasswordManagerEnabled": false,
  "BrowserSignin": 0,
  "IncognitoModeAvailability": 1,
  "QuicAllowed": false,
  "WebRtcIPHandling": "disable_non_proxied_udp",
  "SpellcheckEnabled": false,
  "PrintingEnabled": false,
  "DefaultBrowserSettingEnabled": false,
  "EnableDoNotTrack": true,
  "BlockThirdPartyCookies": true,
  "ForceGoogleSafeSearch": true,
  "SyncDisabled": true
}
EOF

echo "Brave debloat policy applied. Please restart Brave to apply changes."

