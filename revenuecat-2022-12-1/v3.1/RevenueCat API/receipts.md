---
title: "Create a Purchase"
slug: "receipts"
excerpt: "Records a purchase for a user from iOS, Android, or Stripe and will create a user if they don't already exist."
hidden: false
createdAt: "2018-05-08T17:27:35.964Z"
updatedAt: "2020-10-15T14:17:59.272Z"
---
[block:api-header]
{
  "title": "Response"
}
[/block]
If the response is successful, it will contain the updated [Subscriber object](https://docs.revenuecat.com/reference#section-the-subscriber-object-).
[block:callout]
{
  "type": "warning",
  "title": "Public API Key required",
  "body": "This endpoint requires the [public SDK key](doc:authentication) to be used. Since validation is performed securely with the store using the provided `fetch_token`, this is safe. \n\nThe restriction exists to prevent developers from embedding a secret key in their app."
}
[/block]