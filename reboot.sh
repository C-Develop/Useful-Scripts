CLIENT_ID="<client-id-here>"
CLIENT_SECRET="<client-secret-here>"
SERVER_UUID="<server-uuid-here>"
BASE_URL="https://panel.yourserver.tld"

echo ""
echo ""
echo ""
echo ""
echo "SERVER REBOOT SCRIPT"
echo "By Charlie's Development"
echo "https://www.cdevelop.co.uk/"
echo ""
echo ""
echo ""
echo ""
echo "Settings:"
echo "------------------------------"
echo "- Client ID: " $CLIENT_ID
echo "- Panel URL: " $BASE_URL

TOKEN=$(curl -s -X POST -G "$BASE_URL/oauth2/token/request" \
-d grant_type=client_credentials \
-d client_id=$CLIENT_ID \
-d client_secret=$CLIENT_SECRET | jq '.access_token' | tr -d '"');

echo "- Token: " $TOKEN
echo "------------------------------"
echo ""

echo "[SERVER] Stopping Server.."
echo $(curl -s -X "POST" -H "Authorization: Bearer $TOKEN" $BASE_URL/daemon/server/$SERVER_UUID/stop?wait=true)
echo ""
echo ""
echo ""
echo ""echo "[SERVER] Starting Server.."
echo $(curl -s -X "POST" -H "Authorization: Bearer $TOKEN" $BASE_URL/daemon/server/$SERVER_UUID/start)
echo ""
echo ""
echo ""
echo ""
