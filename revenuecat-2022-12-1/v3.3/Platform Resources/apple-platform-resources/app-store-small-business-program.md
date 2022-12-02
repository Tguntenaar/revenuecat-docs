---
title: "App Store Small Business Program"
slug: "app-store-small-business-program"
excerpt: "How to have the reduced commission rate reflected in RevenueCat"
hidden: false
metadata: 
  title: "App Store Small Business Program"
  description: "Apple recently announced the new App Store Small Business Program, aiming to reduce Apple's commission of App Store sales for small businesses from 30% to 15%."
  image: 
    0: "https://files.readme.io/a2963e7-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: "2020-12-11T16:33:54.497Z"
updatedAt: "2021-12-08T06:12:50.985Z"
---
Apple recently announced the new App Store Small Business Program, aiming to reduce Apple's commission of App Store sales for small businesses from 30% to 15%.

While there are specific terms that Apple requires to be eligible for the program, generally most developers who earn under $1 million in App Store revenue per year can apply. You can read more about the App Store Small Business Program [here](https://developer.apple.com/app-store/small-business-program/).

As the reduced rate will affect the data sent for integrations as well as the data displayed in RevenueCat's [charts](doc:charts), it's important to acknowledge membership in the Small Business Program in your app settings.

# How to Apply

To apply for the App Store Small Business Program, head over to the [Apple Developer website](https://developer.apple.com/app-store/small-business-program/). You'll need to be the Account Holder in the Apple Developer Program, accept the latest Paid Applications contract in App Store Connect, and be able to list all associated developer accounts to the account for which you are applying.

After you've read the terms of the program, click 'Enroll'. Apple's form will request a sign-in to your Apple Developer account, and will automatically fill information like your name, email, and Team ID.

Once you enroll you should receive a confirmation email that your enrollment is being reviewed.

# Informing RevenueCat

Since a developer could have multiple apps from different companies represented in their RevenueCat account, the Small Business Program membership status is set on a **per-app basis** in the RevenueCat dashboard.

Visit your app settings in the RevenueCat dashboard (**Project Settings > Apps**) and expand the **Apple Small Business Program** dropdown.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5dbc6bc-image_3.png",
        "image (3).png",
        1098,
        372,
        "#f8f8f8"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
### Entry Date

Enter the effective date of entry for your membership in the Small Business Program. Can be any date in the past or future.

This field is required if you add an **Exit Date**.
[block:callout]
{
  "type": "info",
  "title": "Early Enrollers",
  "body": "If you applied before December 18, 2020 and were notified of your status by December 30, 2020, enter **January 1, 2021**."
}
[/block]
### Exit Date

If you leave or have been removed from the program, enter the effective exit date.

# Considerations

### Backdating Entry into Small Business Program

You can set your entry date at any time, but please note: if you set it to a date in the past, we won't re-send [webhooks](doc:webhooks) and integration events with correct pricing data for transactions that have already occurred. To ensure accurate pricing data is sent to your integrations, set your effective entry date as soon as possible.

### Charts

Charts will correctly calculate proceeds even if the entry date is in the past, but it will take up to 24 hours for your charts to recalculate past data.