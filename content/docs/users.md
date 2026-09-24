---
title: Manage users and roles
description: Invite people to your garden, choose what each one can do, and archive the accounts you no longer need.
group: Admin
weight: 350
---

Every person who uses your garden signs in with their own account, and each
account has one role. This page describes the three roles and how an admin
invites, changes, and archives users. You need the admin role to open the pages
it describes.

To manage your own name, email address, and password, see [Manage your
account](/docs/account/).

## Choose a role

| Role | What it can do |
|---|---|
| Reader | View every record and list, search and export the lists, and view the **Activity** page. Change their own profile and password. |
| Editor | Everything a reader can do, and create, edit, and delete records of every kind. |
| Admin | Everything an editor can do, and change the garden's settings under **Organization**: **General**, **Codes**, **Users**, and **Backups**. |

A reader does not see the controls that change records. The top of a list has
no **Create** or **New** button, and opening a record shows a read-only page that
holds the record's panel, without the form or the tabs. Editors and readers see
only the **Account** group under **Settings**.

Give each person the lowest role that covers their work. A volunteer who looks
plants up needs the reader role. A curator who records arrivals and moves needs
the editor role.

A garden always has at least one admin. Sepal refuses to archive the last admin
or to change their role, and asks you to promote another user to admin first.

## Open the users list

1. Select **Settings** at the bottom of the sidebar.
2. Under **Organization**, select **Users**.

The table lists each user's **Name**, **Email**, **Role**, and **Status**. A
status is one of the following:

- `invited`: the user has an invitation and has not accepted it yet.
- `active`: the user can sign in.
- `archived`: the user can no longer sign in.

Type in the search box to filter the list by name or email address. Archived
users are hidden until you select **Show archived**.

## Invite a user

1. On the **Users** page, select **Invite User**.
2. Enter the person's **Email**.
3. Enter their **Full Name**. The field is optional, and the user can set it
   when they accept.
4. Choose a **Role**.
5. Select **Send Invitation**.

Sepal creates the account with the status `invited` and emails the person a
link. The link expires 24 hours after it is sent. On a self-hosted instance,
email has to be configured before invitations can be sent. [Self-hosting
email settings](/docs/self-hosting/#email) describes how.

Sepal refuses an email address that already belongs to a user. If that user is
archived, activate them instead of inviting them again.

## Resend an invitation

If the link expired or the email went missing, send a new one.

1. Find the user on the **Users** page. Their status reads `invited`.
2. Select the **Resend invitation** icon, which shows an envelope, at the end of
   the row.
3. Confirm.

The new link also expires after 24 hours.

## What the invited user sees

The link in the email opens the **Accept Invitation** page, which reads `Set up
your account for` followed by their email address. The user enters a **Full
Name**, a **Password** of at least eight characters, and the same password again
in **Confirm Password**. They then select **Set Password & Activate Account**.

Sepal activates the account and opens the sign-in page with the email address
filled in. The user signs in with the password they chose.

## Change a user's role

On the **Users** page, choose the new role in the user's **Role** list. Sepal
saves the change as soon as you choose it, and the user has the new role on
their next request.

Your own row shows your role without a list, so you cannot change your own
role. Another admin has to change it.

## Archive a user

Archive an account when its owner no longer works on the collection. Sepal has
no control that deletes a user, so the records they changed still name them in
the activity history.

1. Find the user on the **Users** page.
2. Select the **Archive user** icon at the end of the row.
3. Confirm.

The user is signed out on their next request and cannot sign in again. You
cannot archive your own account.

To restore an archived user, select **Show archived**, find the user, and select
the **Activate user** icon. The user can sign in again with their previous
password.

## What to read next

- [Manage your account](/docs/account/) describes the profile and password
  pages that every user has.
- [Configure your garden](/docs/garden-settings/) describes the other settings
  under **Organization**.
