# Please Change Values for Your Slack WorkSpace.
$token = "SLACK_TOKEN"
$channel = "CHANNEL_NAME"
$username = "BOT_USERNAME"

Add-Type -AssemblyName System.Web

#$channel = [System.Web.HttpUtility]::UrlEncode($channel)
$utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($args)
$text = [System.Text.Encoding]::GetEncoding('UTF-8').GetString($utf8Bytes);
#$text = [System.Web.HttpUtility]::UrlEncode($text)

$headerargs = @{}
$headerargs.Add("Authorization", "Bearer " + $token)
$headerargs.Add("Content-Type", "application/json;charset=utf-8")

$postargs = [ordered]@{}
#$postargs.Add("token", $token)
$postargs.Add("channel", $channel)
$postargs.Add("username", $username)
$postargs.Add("text", $text)

$postJson = ConvertTo-Json -Compress $postargs

echo $postargs
echo $postJson
#Invoke-RestMethod -Uri "https://slack.com/api/chat.postMessage?token=$token&channel=$channel&text=$text&username=$username" -Method Get
Invoke-RestMethod -Method Post -Uri https://slack.com/api/chat.postMessage -Headers $headerargs -Body $postJson