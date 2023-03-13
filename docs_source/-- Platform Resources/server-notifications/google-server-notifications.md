---
title: "Google Real-Time Developer Notifications"
slug: "google-server-notifications"
excerpt: "Sending Google Play server notifications to RevenueCat"
hidden: false
metadata: 
  title: "Google Play server notifications – RevenueCat"
  description: "RevenueCat does not require server notifications from Google Play, however doing so can speed up webhook and integration delivery times and reduce lag time for Charts."
  image: 
    0: "https://files.readme.io/0417ecd-RevenueCat_Docs_OG.png"
    1: "RevenueCat Docs OG.png"
    2: 1200
    3: 627
    4: "#f7f5f5"
createdAt: "2020-09-29T15:21:39.999Z"
updatedAt: "2022-12-16T16:01:33.511Z"
---
RevenueCat does not require server notifications from Google Play, however doing so can speed up webhook and integration delivery times and reduce lag time for [Charts](doc:charts).

# Setup Instructions

[Google real-time developer notifications](https://developer.android.com/google/play/billing/realtime_developer_notifications) can be set up directly from the RevenueCat dashboard. This will set up a new subscriber to Google's subscription status notifications, which will not affect any existing subscribers you may already have in place.

1. **Ensure Google Cloud Pub/Sub is enabled for your project**. You can enable it [here](https://console.cloud.google.com/flows/enableapi?apiid=pubsub).
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/123bf8c-87c2164-enable_pubsub.png",
        "87c2164-enable_pubsub.png",
        496,
        298,
        "#d4e2f4"
      ],
      "sizing": "smart"
    }
  ]
}
[/block]
2. Navigate to your ** Apps** under project settings in the RevenueCat dashboard.
3. Select the **Play Store app**  you are adding  Google Developer Notifications. 
4. Select view under *Service Account credentials JSON * and add your JSON object in the pop-up window. 
5.  Finally click '*Connect to Google*.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/050eea5-Screen_Shot_2021-12-01_at_10.53.53_AM.png",
        "Screen Shot 2021-12-01 at 10.53.53 AM.png",
        1264,
        830,
        "#f9fafa"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
4. You will see a generated Google Cloud Pub/Sub topic ID, as shown below.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/0ab957a-Screen_Shot_2021-12-01_at_11.04.27_AM.png",
        "Screen Shot 2021-12-01 at 11.04.27 AM.png",
        1190,
        100,
        "#ebeced"
      ],
      "sizing": "80"
    }
  ]
}
[/block]
5. Click the **Copy** button to copy the topic ID to your clipboard.
6. Open the Google Play Console for your app and navigate to **Monetization setup**.
7. In the "Real-time developer notifications" section, paste in your topic ID and then click on **Save**

If you don't see any errors, your real-time developer notifications should be ready to go.

# Send Test Notification

There is an option in Google Play to send a test notification. This is a great way to verify that Google Pub/Sub is correctly connected to your RevenueCat account.

Click the "Send test notification" button under the "Topic name" in the "Monetization setup" section
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/540cd15-Screen_Shot_2022-12-16_at_9.52.55_AM.png",
        "Screen Shot 2022-12-16 at 9.52.55 AM.png",
        1282,
        492,
        "#000000"
      ]
    }
  ]
}
[/block]
Once that test notification is sent, you can go back to your app config on the RevenueCat dashboard where you connected to Google to enable real-time notifications. If the configuration was successful, you should see a "Last received" label with a recent timestamp.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/a3943e9-Screen_Shot_2022-12-16_at_9.55.38_AM.png",
        "Screen Shot 2022-12-16 at 9.55.38 AM.png",
        685,
        228,
        "#000000"
      ]
    }
  ]
}
[/block]
# Considerations
[block:callout]
{
  "type": "warning",
  "title": "Service Credentials take ~36hrs to go into effect",
  "body": "If you receive a credentials error, make sure you've waited at least 36hrs after creating your [Google Service Credentials](creating-play-service-credentials) before connecting to Google Real-Time Developer Notifications."
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "400 error when connecting to Google",
  "body": "If you're getting a 400 error when connecting to Google for [Platform Server Notifications](doc:google-server-notifications) from the RevenueCat dashboard, ensure you've enabled Pub/Sub for your project as described above."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If you need to use an existing Pub/Sub topic with RevenueCat, [contact support](https://app.revenuecat.com/settings/support)."
}
[/block]