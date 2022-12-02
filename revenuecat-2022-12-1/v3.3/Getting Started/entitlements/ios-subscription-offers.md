---
title: "iOS Subscription Offers"
slug: "ios-subscription-offers"
excerpt: "Implementing iOS Subscription Offers with Purchases SDK"
hidden: false
metadata: 
  title: "Implementing iOS Subscription Offers | RevenueCat"
  description: "In iOS 12.2, Apple announced a new feature for subscription developers called “Subscription Offers.” Subscription offers allow developers to apply custom pricing and trials to existing and lapsed subscriptions."
  image: 
    0: "https://files.readme.io/858a800-60993e3c40039b67596bcc8c_slack-preview.png"
    1: "60993e3c40039b67596bcc8c_slack-preview.png"
    2: 1200
    3: 627
    4: "#f45476"
createdAt: {}
updatedAt: "2022-02-10T11:25:50.791Z"
---
[block:callout]
{
  "type": "success",
  "body": "This guide assumes you already have your iOS products set up in App Store Connect.",
  "title": ""
}
[/block]
In iOS 12.2, Apple announced a new feature for subscription developers called “Subscription Offers.” Subscription Offers allow developers to apply custom pricing and trials to existing and lapsed subscriptions.

Subscription Offers are supported in the *Purchases SDK*, but require some additional setup first in App Store Connect and the RevenueCat dashboard. 

# Types of Subscription Offers
[block:parameters]
{
  "data": {
    "h-0": "Offer Type",
    "h-1": "Applies To",
    "0-0": "Introductory Offers",
    "1-0": "Promotional Offers",
    "h-2": "Subscription Key Required",
    "h-3": "Notes",
    "2-0": "Offer Codes",
    "0-1": "New Users",
    "1-1": "Existing and Lapsed Users",
    "1-2": "✅",
    "0-2": "❌",
    "2-2": "✅",
    "0-3": "SDK applies offer to purchases automatically",
    "2-1": "New and Existing Users",
    "1-3": "Not applied automatically, see implementation guide below",
    "2-3": "Requires iOS SDK 3.8.0+, see implementation guide below",
    "3-0": "⚠️ **Not recommended**\n[In-App Purchase Promo Codes](https://help.apple.com/app-store-connect/#/dev50869de4a)",
    "3-1": "New and Existing Users",
    "3-2": "❌",
    "3-3": "Treated as a regular purchase, revenue will not be accurate in [Charts](doc:charts) and [Integrations](doc:webhooks) due to Apple/StoreKit limitations. Codes don't auto-renew, aren't compatible with `presentCodeRedemptionSheet`, restricted to non-commercial use, and restricted to [1,000 codes every 6 months](https://help.apple.com/app-store-connect/#/dev50869de4a)."
  },
  "cols": 4,
  "rows": 4
}
[/block]
# In-App Purchase Keys

For RevenueCat to securely authenticate and validate a Subscription Offer request with Apple, you'll need to upload an In-App Purchase Key following our [guide](https://docs.revenuecat.com/docs/in-app-purchase-key-configuration).
[block:callout]
{
  "type": "info",
  "title": "Introductory Offers",
  "body": "An In-App Purchase Key is not required for Introductory Offers, only for Promotional Offers and Offer Codes. The Purchases SDK will automatically apply an introductory offer to a purchase. [Documentation](https://docs.revenuecat.com/docs/ios-products#adding-introductory-offers-and-free-trials) for reference."
}
[/block]
# Promotional Offers

## 1. Configure the Offer in App Store Connect

Promotional Offers are created from within App Store Connect and are included as a pricing option to an existing subscription product. When you click the "+" option next to Subscription Prices, you'll see an option to Create Promotional Offer.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fd483c8-Screen_Shot_2019-04-17_at_3.32.04_PM.png",
        "Screen Shot 2019-04-17 at 3.32.04 PM.png",
        431,
        454,
        "#f9f8f8"
      ],
      "caption": "Subscription Offers are created as new pricing options in App Store Connect"
    }
  ]
}
[/block]
To create the offer there are two fields that you need to specify: Reference Name, which is just used for your reference, and the Promotional Offer Identifier, which is what you will actually use to activate a specific offer in your app.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/9918b71-Frame_276.png",
        "Frame 276.png",
        1806,
        1122,
        "#fcfcfd"
      ]
    }
  ]
}
[/block]
On the next screen you'll select the type of offer you wish to provide. Just like introductory offers, there are three types of Promotional Offers:

1. Pay-up-front — The customer pays once for a period of time, e.g. $0.99 for 3 months. Allowed durations are 1, 2, 3, 6 and 12 months.
2. Pay-as-you-go — The customer pays a reduced rate, each period, for a number of periods, e.g. $0.99 per month for 3 months. Allowed durations are 1-12 months. Can only be specified in months.
3. Free — This is analogous to a free trial, the user receives 1 of a specified period free. The allowed durations are 3 days, 1 week, 2 weeks, 1 month, 2 months, 3 months, 6 months, and 1 year.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/5bf1bca-Screen_Shot_2019-04-17_at_3.44.39_PM.png",
        "Screen Shot 2019-04-17 at 3.44.39 PM.png",
        907,
        567,
        "#fafafa"
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Don't forget to click Save in the upper right after you configure the offer."
}
[/block]
## 2. Show the Promotional Offer to Desired Users

It's up to you to decide which users you want to present a Promotional Offer to. The only eligibility requirements are that the user had (or currently has) an active subscription. Apple automatically enforces this requirement for you - if it's not met users will be shown the regular product regardless of the offer you try to present.

### Fetch the Payment Discount

Before you can present a Promotional Offer to a user, you first need to fetch the `SKPaymentDiscount`. This is done by passing the `SKProductDiscount` and `SKProduct` to the `.paymentDiscount` method, which uses the Subscription Key from Step 2 to validate the discount.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.paymentDiscount(for: product.discounts[0], product: product, completion: { (discount, error) in\n    \n    if let paymentDiscount = discount {\n        \n        // Payment discount fetched\n    }\n})",
      "language": "swift"
    },
    {
      "code": "[RCPurchases.sharedPurchases paymentDiscountForProductDiscount:product.discounts[0] product:product completion:^(SKPaymentDiscount * _Nullable discount, NSError * _Nullable error) {\n\tif (discount) {\n  \t// Payment discount fetched\n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "const paymentDiscount = await Purchases.getPaymentDiscount(product, product.discounts[0]);\nif (paymentDiscount) {\n  \t// Payment discount fetched\n}\n \n\n",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]
### Purchase the Product Discount

After successfully fetching the `SKPaymentDiscount`, you can now display the Promotional Offer to the user however you'd like. If the user chooses to purchase, pass an `SKProduct` and `SKPaymentDiscount` to the `.purchasePackage` method.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.purchasePackage(package, discount: paymentDiscount, { (transaction, purchaserInfo, error, cancelled) in\n    if purchaserInfo?.entitlements.all[\"your_entitlement_id\"]?.isActive == true {\n        // Unlock that great \"pro\" content\n    }\n})",
      "language": "swift"
    },
    {
      "code": "[RCPurchases.sharedPurchases purchasePackage:package withDiscount:discount completionBlock:^(SKPaymentTransaction * _Nullable transaction, RCPurchaserInfo * _Nullable purchaserInfo, NSError * _Nullable error, BOOL userCancelled) {\n  if (purchaserInfo.entitlements[\"your_entitlement_id\"].isActive) {\n    // Unlock that great \"pro\" content    \n  }\n}];",
      "language": "objectivec",
      "name": "Objective-C"
    },
    {
      "code": "const purchaseMade = await Purchases.purchaseDiscountedPackage(package, paymentDiscount);",
      "language": "javascript",
      "name": "React Native"
    }
  ]
}
[/block]
# Offer Codes

With iOS 14, Apple announced a new feature for subscription developers called “Offer Codes.” Offer Codes allow developers to offer custom pricing and trials, in the form of a redeemable code, to their customers.

## 1. Configuring an Offer Code

Offer Codes are configured similarly to Subscription Offers in App Store Connect. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/4a0ab13-Screen_Shot_2020-12-01_at_10.02.15_AM.png",
        "Screen Shot 2020-12-01 at 10.02.15 AM.png",
        1044,
        432,
        "#f8f9f9"
      ],
      "sizing": "80",
      "border": true
    }
  ]
}
[/block]
## 2. Redeeming an Offer Code

To allow your users to redeem Offer Codes, you'll need to present the Offer Code redemption sheet. In *Purchases SDK* 3.8.0, you can call the `presentCodeRedemptionSheet` method.
[block:code]
{
  "codes": [
    {
      "code": "Purchases.shared.presentCodeRedemptionSheet()",
      "language": "swift",
      "name": "Swift"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "The Offer Code redemption sheet may not display on a device if you haven't yet launched the App Store app and accepted the terms agreement."
}
[/block]
## Considerations

- Due to limitations of available information on Offer Codes, accurate revenue tracking is not yet supported in the RevenueCat dashboard. All Offer Codes are assumed to be $0 transactions.

# Next Steps

* For a guided walkthrough of implementing Subscription Offers into a Swift app [check out our blog :fa-arrow-right:](https://www.revenuecat.com/blog/signing-ios-subscription-offers)