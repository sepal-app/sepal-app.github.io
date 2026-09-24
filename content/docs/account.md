---
title: Manage your account
description: Change your name, email address, and password, sign out, and reset a forgotten password.
group: Getting started
weight: 30
---

Every user has a **Profile** page and a **Security** page, whatever their role.
Both are under **Settings** at the bottom of the sidebar, in the **Account**
group.

## Change your name or email address

1. Select **Settings**, then select **Profile**.
2. Change **Full name** or **Email**.
3. Select **Save changes**.

You sign in with the address in **Email**, so changing it changes the address
you sign in with.

## Sign out

Select **Settings**, then **Profile**, then **Logout** at the top right of the
page.

## Change your password

1. Select **Settings**, then select **Security**.
2. Enter your **Current password**.
3. Enter a **New password** of at least eight characters, and enter it again in
   **Confirm new password**.
4. Select **Change password**.

Sepal checks the current password before it saves the new one, and reports
`Current password is incorrect` if it does not match.

## Reset a forgotten password

1. On the sign-in page, select **Forgot password?**.
2. Enter the email address you sign in with, and select **Send**.
3. Open the link in the email. It expires 30 minutes after it is sent.
4. Enter a new **Password** of at least eight characters, enter it again in
   **Confirm password**, and select **Reset Password**.
5. Sign in with the new password.

The page reads `Check your email.` whether or not the address belongs to an
account, so it does not reveal who has one. Sepal sends the email only to an
active account. If you were invited and never accepted, ask an admin to resend
the invitation instead.

An admin cannot set or reset another user's password. On a self-hosted
instance, password reset needs email to be configured. [Self-hosting email
settings](/docs/self-hosting/#email) describes how.

## What to read next

- [Manage users and roles](/docs/users/) describes what each role can do.
