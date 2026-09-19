---
title: Sepal Cloud
date: 2026-09-19
description:
---

In the last post I mentioned that we would be offering a hosted version of
Sepal. Sepal Cloud will be the same Sepal as the open-source version but where
we handle the servers, storage, backups, media management and everything else
and let you focus on managing your plant records.


I truly believe in the importance of ex situ conservation and the value of good
plant records at botanic gardens. Well-managed plant records shouldn't be a
luxury that only gardens with technical staff or a large software budget can
afford. In fact this is exactly the situation that spawned Sepal. Back in 2005
Belize Botanic Gardens didn't have a budget for plant collection software so I
created Bauble. Sepal is the spiritual successor of Bauble.

Because of this, the self-hosted version of Sepal will always be free
and open-source. You will always be able to download your database from
Sepal Cloud and run it in your self-hosted version of Sepal.

And not only will the self-hosted version of Sepal always be free but also my
intention is to keep Sepal Cloud subscriptions reasonably priced. We won't be
offering any region-based discounting since, to be honest, if we hosted it for
any cheaper we would be losing money. Sepal does cost money to run and develop
but we will do our best to keep Sepal Cloud affordable.

To keep Sepal Cloud subscriptions reasonably priced I've had to get creative
with the architecture. While this part of Sepal will remain proprietary I will
be giving a peek into the internals of Sepal and Sepal Cloud in later, more
technical blog posts.

## What you get with Sepal Cloud

When you sign up, you pick a name and a subdomain for your garden and you land on something
like `yourgarden.sepal.app`. From there:

- Your garden is its own database. It isn't a row in a big shared table with everyone
  else's plants, which means your records can be handed back to you as one file whenever
  you want them.
- The World Flora Online plant list is already loaded when your garden is
  created to give your a head start on your taxonomy.
- Backups run daily and you can download any of them from your settings page.
- Media storage is included, and how much depends on the plan. Photos of your plants live
  in the same place as the records about them.
- Upgrades happen in the background. When we ship a change, your garden gets
  migrated without you scheduling anything. 

## What it costs

We're starting with three plans. 
- Personal is $10 a month and covers 500 accessions and 2 GB of media storage,
  which suits a private collection.
- Garden is $40 a month for 3,000 accessions and 10 GB of media storage, and
  it's the one most small gardens and nurseries want.
- Institution is $150 a month for unlimited accessions and 50 GB of media
  storage.

Paying annually gets you a month free on any of them.

You can sign up and start a generous trial without a credit card. If you need
higher limits or a bigger instance, or you want help with a self-hosted setup,
[email me](mailto:support@sepal.app) and we'll work something out.

## No lock-in

All of your data can be exported at any time to CSV. Your settings page has a
download button that hands you a zip of your whole database. The app is licensed
under the [AGPL](https://www.gnu.org/licenses/agpl-3.0.en.html) so you can
download the code and run your own version of Sepal. You are free to leave at
any time and take your plant records with you.

Your plant records will outlast my company. They should never be hostage to it.

Kind regards,{{< linebreak >}}
Brett Adams, CEO
