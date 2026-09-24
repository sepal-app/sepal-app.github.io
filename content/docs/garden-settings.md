---
title: Configure your garden
description: Set your organization's details and timezone, the format of accession and material codes, and the backup schedule.
group: Admin
weight: 360
---

The settings under **Organization** apply to the whole garden, and only an
admin can open them. To reach them, select **Settings** at the bottom of the
sidebar. Editors and readers see only the **Account** group there, which [Manage
your account](/docs/account/) describes. This page describes **General**, **Codes**, and **Backups**. [Manage
users and roles](/docs/users/) describes **Users**.

## Set your organization's details

1. Under **Organization**, select **General**.
2. Fill in the fields you need. All of them are optional.
3. Select **Save changes**.

The page has four sections:

- **Organization Identity** holds **Long name**, **Short name**, and
  **Abbreviation**.
- **Contact Information** holds **Email**, **Phone**, and **Website**.
- **Address** holds **Street address**, **City**, **Postal code**, and
  **Country**.
- **Regional Settings** holds **Timezone**.

The short name appears in the browser tab and in the subject line of
invitation emails. When the short name is empty, Sepal uses the long name.

## Set the timezone

Sepal shows every date and time in the garden's timezone, and uses it to decide
what today's date is. Today's date matters in two places: a date received or
accessioned cannot be later than today, and date tokens in a code template take
today's values.

1. Under **Organization**, select **General**.
2. Under **Regional Settings**, choose a **Timezone**. Type part of a city name
   to narrow the list.
3. Select **Save changes**.

## Set the code format

A code template sets the code that Sepal suggests on the create form for
accessions and for material. It does not change the codes of records you have
already saved.

1. Under **Organization**, select **Codes**.
2. Under **Accessions**, enter a **Template**. The **Next** line below the field
   shows the code the next accession would get.
3. Under **Material**, enter a **Template**. The **For example** line shows a
   full material code built from it.
4. Select **Save changes**.

A new garden starts with `{year}.{seq:0000}` for accessions and `{seq}` for
material. To stop suggesting a code, clear the template.

### Tokens

A template is literal text with tokens in braces. It needs exactly one
sequence token, either `{seq}` or `{letter}`.

| Token | Becomes |
|---|---|
| `{year}` | The four-digit year, such as `2026` |
| `{year2}` | The two-digit year, such as `26` |
| `{month}` | The two-digit month, such as `09` |
| `{day}` | The two-digit day of the month, such as `24` |
| `{seq}` | The next number, such as `1` |
| `{seq:0000}` | The next number padded with zeros to the number of zeros written, such as `0001` |
| `{letter}` | The next letter, counting `A` to `Z` and then `AA`, `AB`, and so on |

A number that outgrows its padding keeps all its digits, so `{seq:0000}` counts
from `9999` to `10000`.

Sepal finds the next number by reading the codes already saved. It takes the
highest number among the codes that fit the template with today's date values,
and adds one. It does not fill gaps, so after `2026.0001` and `2026.0003` the
next code is `2026.0004`. With `{year}` in the template, the sequence starts
again at one when the year changes.

Material is numbered within its accession, so the sequence starts again at one
for every accession.

### Reject codes that do not fit

Select **Reject a code that does not fit** under a template to enforce it. The
box is available only when the template beside it is filled in.

With enforcement on, Sepal refuses to create a record whose code does not fit
the template, and shows a code that does. When someone edits an existing
record, Sepal warns them instead, and they can select **Save it anyway**. That
way codes that predate the template can still be kept.

### Set the material code separator

A material's full code is its accession's code, the separator, and the
material's own code. With the separator `.`, material `1` of accession
`2026.0001` reads as `2026.0001.1`.

1. Under **Material**, enter a **Separator**. A new garden starts with `.`.
   Leave the field empty for no separator.
2. Select **Save changes**.

Sepal builds the full code each time it shows one, so a new separator applies
at once to every material, including the ones already saved. The full code
appears wherever Sepal names a material, such as the **Material** list and the
activity history.

With no separator, a material code that starts with a digit runs into an
accession code that ends with one, and the page warns you. For example,
`2026.0001` and `1` read as `2026.00011`. A letter sequence avoids that. With
`{letter}` as the material template and no separator, the first material of
`2026.0001` reads as `2026.0001A`.

## Schedule backups

A backup is a ZIP file that holds a copy of the database. It does not include
media files, which are stored separately and have to be backed up on their own.

1. Under **Organization**, select **Backups**.
2. Under **Backup Schedule**, set **Frequency** to **Daily**, **Weekly**, or
   **Monthly**. Choose **Disabled** to stop scheduled backups.
3. Select **Save changes**.

The page then shows the time of the next backup, and the time of the last one
once a backup has run.

## Download a backup

Under **Recent Backups**, each backup is listed with its **Filename**, **Size**,
and **Created** time. Select **Download** to save a copy.

On a garden hosted by Sepal, backups are scheduled for you. The **Backups** page
shows only the list of backups to download.

On a self-hosted instance, Sepal writes backups to the directory named by
`BACKUP_PATH` and keeps them until you delete them. [Self-hosting](/docs/self-hosting/#server)
describes the setting.

## What to read next

- [Manage users and roles](/docs/users/) describes the **Users** settings.
- [Add and edit accessions](/docs/accessions/) describes how the code template
  appears on the accession form.
