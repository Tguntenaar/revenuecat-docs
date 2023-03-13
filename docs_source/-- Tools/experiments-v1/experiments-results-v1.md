---
title: "Experiments Results"
slug: "experiments-results-v1"
hidden: false
createdAt: "2022-10-13T18:44:47.136Z"
updatedAt: "2022-11-30T20:37:55.764Z"
---
Within 24 hours of your experiment's launch you'll start seeing data on the Results page. RevenueCat offers experiment results through each step of the subscription journey to give you a comprehensive view of the impact of your test. You can dig into these results in a few different ways, which we'll cover below.

# Results chart

The Results chart should be your primary source for understanding how a specific metric has performed for each variant over the lifetime of your experiment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/12ac18a-Screen_Shot_2022-10-13_at_2.47.13_PM.png",
        "Screen Shot 2022-10-13 at 2.47.13 PM.png",
        1824,
        1504,
        "#000000"
      ]
    }
  ]
}
[/block]
By default you'll see your **Realized LTV per customer* for all platforms plotted daily for the lifetime of your experiment, but you can select any other experiment metric to visualize, or narrow down to a specific platform.
[block:callout]
{
  "type": "info",
  "title": "Why Realized LTV per customer?",
  "body": "Lifetime value (LTV) is the standard success measure you should be using for pricing experiments because it captures the full revenue impact on your business. Realized LTV per customer measures the revenue you've accrued so far divided by the total customers in each variant so you understand which variant is on track to produce higher value for your business.\n\nKeep in mind that your LTV over a longer time horizon might be impacted by the renewal behavior of your customers, the mix of product durations they're on, etc."
}
[/block]
You can also click **Export chart CSV** to receive an export of all metrics by day for deeper analysis. 
[block:callout]
{
  "type": "info",
  "title": "Data takes 24 hours to appear",
  "body": "The results refresher runs once every 24 hours.\n \nIf you're not seeing any data or are seeing unexpected results, try:\n- **Ensuring each product that is a part of the experiment has been purchased at least once**\n- **Waiting another 24 hours until the model can process more data**\n\nWhen you stop an experiment, the results will continue to be updated for 28 days to capture any additional subscription events."
}
[/block]
# Customer journey tables
The customer journey tables can be used to dig into and compare your results across variants. 

The customer journey for a subscription product can be complex: a "conversion" may only be the start of a trial, a single payment is only a portion of the total revenue that subscription may eventually generate, and other events like refunds and cancellations are critical to understanding how a cohort is likely to monetize over time.

To help parse your results, we've broken up experiment results into three tables:
1. **Initial conversion:** For understanding how these key early conversion rates have been influenced by your test. These metrics are frequently the strongest predictors of LTV changes in an experiment.
2. **Paid customers:** For understanding how your initial conversion trends are translating into new paying customers.
3. **Revenue:** For understanding how those two sets of changes interact with each other to yield overall impact to your business.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/24e17e5-Screen_Shot_2022-10-18_at_1.20.47_PM.png",
        "Screen Shot 2022-10-18 at 1.20.47 PM.png",
        1820,
        2314,
        "#000000"
      ]
    }
  ]
}
[/block]
In addition to the results per variant that are illustrated above, you can also analyze most metrics by product as well. Click on the caret next to "All" within metrics that offer it to see the metric broken down by the individual products in your experiment. This is especially helpful when trying to understand what's driving changes in performance, and how it might impact LTV. (A more prominent yearly subscription, for example, may decrease initial conversion rate relative to a more prominent monthly option; but those fewer conversions may produce more Realized LTV per paying customer)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2326dd9-Untitled_1.png",
        "Untitled (1).png",
        2419,
        1128,
        "#000000"
      ],
      "caption": ""
    }
  ]
}
[/block]
The results from your experiment can also be exported in this table format using the **Export data CSV** button. This will included aggregate results per variant, and per product results, for flexible analysis.

# Metric definitions

## Initial conversion metric definitions
[block:parameters]
{
  "data": {
    "h-0": "Metric",
    "h-1": "Definition",
    "0-0": "Customers",
    "0-1": "All new customers who've been included in each variant of your experiment.",
    "1-0": "Initial conversions",
    "1-1": "A purchase of any product offered to a customer in your experiment. This includes products with free trials and non-subscription products as well.",
    "2-0": "Initial conversion rate",
    "2-1": "The percent of customers who purchased any product.",
    "3-0": "Trials started",
    "3-1": "The number of trials started.",
    "4-0": "Trials completed",
    "5-0": "Trials converted",
    "6-0": "Trial conversion rate",
    "4-1": "The number of trials completed. A trial may be completed due to its expiration or its conversion to paid.",
    "5-1": "The number of trials that have converted to a paying subscription. Keep in mind that this metric will lag behind your trials started due to the length of your trial. For example, if you're offering a 7-day trial, for the first 6 days of your experiment you will see trials started but none converted yet.",
    "6-1": "The percent of your completed trials that converted to paying subscriptions."
  },
  "cols": 2,
  "rows": 7
}
[/block]
## Paid customers metric definitions
[block:parameters]
{
  "data": {
    "h-0": "Metric",
    "h-1": "Definition",
    "0-0": "Paid customers",
    "1-0": "Conversion to paying",
    "2-0": "Active subscribers",
    "3-0": "Churned subscribers",
    "4-0": "Refunded customers",
    "0-1": "The number of customers who made at least 1 payment. This includes payments for non-subscription products, but does NOT include free trials.\n\nCustomers who later received a refund will be counted in this metric, but you can use \"Refunded customers\" to subtract them out.",
    "1-1": "The percent of customers who made at least 1 payment.",
    "2-1": "The number of customers with an active subscription as of the latest results update.",
    "3-1": "The number of customers with a previously active subscription that has since churned as of the latest results update. A subscriber is considered churned once their subscription has expired (which may be at the end of their grace period if one was offered).",
    "4-1": "The number of customers who've received at least 1 refund."
  },
  "cols": 2,
  "rows": 5
}
[/block]
## Revenue metric definitions
[block:parameters]
{
  "data": {
    "h-0": "Metric",
    "h-1": "Definition",
    "0-0": "Realized LTV (revenue)",
    "1-0": "Realized LTV per customer",
    "2-0": "Realized LTV per paying customer",
    "3-0": "Total MRR",
    "4-0": "MRR per customer",
    "5-0": "MRR per paying customer",
    "0-1": "The total revenue you've received (realized) from each experiment variant.",
    "1-1": "The total revenue you've received (realized) from each experiment variant, divided by the number of customers in each variant.\n\nThis should frequently be your primary success metric for determining which variant performed best.",
    "2-1": "The total revenue you've received (realized) from each experiment variant, divided by the number of paying customers in each variant.\n\nCompare this with \"Conversion to paying\" to understand if your differences in Realized LTV are coming the payment conversion funnel, or from the revenue generated from paying customers.",
    "3-1": "The total monthly recurring revenue your current active subscriptions in each variant would generate on a normalized monthly basis.\n\n[Learn more about MRR here.](https://www.revenuecat.com/docs/charts#monthly-recurring-revenue-mrr)",
    "4-1": "The total monthly recurring revenue your current active subscriptions in each variant would generate on a normalized monthly basis, divided by the number of customers in each variant.",
    "5-1": "The total monthly recurring revenue your current active subscriptions in each variant would generate on a normalized monthly basis, divided by the number of paying customers in each variant."
  },
  "cols": 2,
  "rows": 6
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Only new users are included in the results",
  "body": "To keep your A and B cohorts on equal footing, only new users are added to experiments. Here's an example to illustrate what can happen if existing users are added to an experiment: an existing user who is placed in a cohort might make a purchase they wouldn't otherwise make because the variant they were shown had a lower price than the default offering they previously saw. This might mean that the user made a purchase out of fear that they were missing out on a sale and wanted to lock in the price in anticipation of it going back up."
}
[/block]
## Example

In the example shown in the below screenshot, there have been no trial completions, active subscriptions, or churn. While the model will be able to make a prediction (possibly with high confidence), it won't be representative of real-world user behavior, so in this case you should wait until you have a good distribution of data.