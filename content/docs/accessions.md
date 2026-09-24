---
title: Add and edit accessions
description: The accession form field by field, and the tabs that open once the record exists.
group: The collection
weight: 300
---

An [accession](/docs/glossary/#accession) is one arrival of one
[taxon](/docs/glossary/#taxon). This page describes the accession form field by
field and the tabs that open once a record exists. [Your first
week](/docs/your-first-week/) walks through creating the first one step by step.

## Create an accession

Select **Accessions** in the sidebar, then select **New accession**. Fill in the
form and select **Save**. Sepal requires a **Code** and a **Taxon**. Every other
field is optional, and you can fill it in later.

Creating an accession needs the editor or admin role. A reader who opens an
accession sees the summary panel instead of the form.

## Identity

**Code** is your garden's accession number, and it has to be unique. On a new
accession the field is already filled in with the next code in your garden's
sequence. By default that is the year and a four-digit serial number, such as
`2026.0001`. You can keep the suggestion or type your own. If someone else
takes the code before you save, select the refresh icon beside the field to
fetch the next one.

An admin can change the code format, and can set Sepal to reject codes that do
not fit it. With that setting on, Sepal refuses a new code that does not fit and
shows one that does. When you edit an existing accession, Sepal warns you
instead of refusing, and **Save it anyway** keeps the code you typed.

**Taxon** is the botanical name of the accession. Start typing a name and
select one of the results. The field searches the taxa your instance holds, so
you rarely have to add a name yourself. On a new accession, choosing a cultivar,
a Group, or a grex sets **Provenance Type** to `Cultivated`, unless you have
already set it yourself.

**ID Qualifier** and **ID Qualifier Rank** record how confident the
identification is. They are covered in [Qualify an uncertain
identification](#qualify-an-uncertain-identification) below.

## Provenance

[Provenance](/docs/glossary/#provenance) records how the plant came to be where
it is. Every field in this section is optional.

**Provenance Type** takes one of `Wild`, `Cultivated`, `Not wild`, `Purchase`,
and `Insufficient data`. The glossary lists what each value means.

**Wild Provenance Status** takes one of `Wild native`, `Wild non native`,
`Cultivated native`, `Cultivated`, `Not wild`, `Purchase`, and `Insufficient
data`. Set it only for wild-collected material. Sepal does not clear it when you
change the provenance type, so check it if you revise a record.

**Supplier** is the nursery, garden, or collector the plant came from. The field
points at a [contact](/docs/glossary/#contact), and you search it the same way
you search for a taxon.

## Placement

**Intended location** is the [location](/docs/glossary/#location) the material is
meant to go into before anything is planted. Leave it empty until the bed is
decided.

Setting it puts the accession in the location's **Awaiting planting** section,
where a **Plant here** link opens the material form with the accession already
filled in. The accession leaves that section as soon as it has material in the
location it was intended for.

## Receipt

**Date Received** is the day the plant reached you. **Date Accessioned** is the
day you entered it in the collection. Both take a full date, and neither
accepts a date in the future.

**Received as** records the form the plant arrived in, such as `Seed`, `Bulb`,
or `Rooted cutting`. **Quantity received** records how many arrived. Both
describe the arrival, so they stay as you recorded them when the material is
later planted, divided, or lost.

## Qualify an uncertain identification

When the name on the label is not certain, record a qualifier with it.

1. Open the accession and stay on the **General** tab.
2. Under **Identity**, set **ID Qualifier** to one of `aff`, `cf`, `forsan`,
   `incorrect`, `near`, and `questionable`.
3. Set **ID Qualifier Rank** to the rank the doubt applies to. The values are
   `Below family`, `Family`, `Genus`, `Species`, `First infraspecific epithet`,
   `Second infraspecific epithet`, and `Cultivar`.
4. Select **Save**.

Both fields are optional and independent of each other. Sepal stores the
qualifier beside the name and does not change the name, so the accession still
matches a search for the taxon you recorded.

## Edit an accession

Open the accession from the **Accessions** list. The **General** tab holds the
same form you filled in when you created the record. Change what you need and
select **Save**, or select **Cancel** to reload the record as it was.

Every save writes an [activity](/docs/glossary/#activity), so the **Activity**
section of the panel shows who changed the record and when.

## Delete an accession

1. Open the accession.
2. Select **Actions**, then select **Delete**.
3. Read the confirmation and select **Delete**.

Sepal refuses to delete an accession that still has material, or that a
propagation names as its parent. The dialog lists what is in the way, and you
delete or move those records first. Deleting an accession also removes its
notes, its tags, and its collection data, and it unlinks its media. You cannot
undo a delete.

## Record wild-collection data

The **Collection** tab holds the field data behind a wild-collected accession:
**Collector**, **Collector's Number**, **Collection Date**, **Habitat**,
**Associated Taxa**, **Remarks**, **Country**, **Province/State**, **Locality**,
**Latitude**, **Longitude**, **Coordinate System**, **Uncertainty (m)**,
**Elevation (m)**, and **Elevation Accuracy (m)**.

The tab is available when **Provenance Type** is `Wild`, and it stays available
on any accession that already has collection data on it. On an accession with
neither, the tab is disabled and reads `Available when provenance is wild
collected`.

## Add a note

A note is free text on the record. Use one for anything the form has no field
for.

1. Open the accession and select the **Notes** tab.
2. Type the text in **Note**.
3. Select **Add note**.

The note appears in the list below the form with the time it was written and the
email address of whoever wrote it. Select **Edit** on a note to change it, or
**Delete** to remove it. Sepal asks `Delete this note?` before it removes one.
The three most recent notes also appear in the **Notes** section of the panel,
so a reader who cannot open the tab can still see them.

## Add a tag

A [tag](/docs/glossary/#tag) is a label you attach to records so that you can
find them together.

1. Open the accession and select the **Tags** tab.
2. Type a name in **Tag**. The field suggests the tags that already exist.
3. Select **Add**.

A name that matches an existing tag links that tag. A name that matches nothing
creates the tag and then links it. To take one off, select the remove icon on
the tag and confirm.

Once an accession is tagged, `tag:` filters the **Accessions** list by it.

```
tag:rescue
```

## What to read next

- [Track material and locations](/docs/material-and-locations/) describes the
  plants an accession becomes.
- [Search your collection](/docs/search/) describes how to find an accession
  once you have more than a screenful.
- [Glossary](/docs/glossary/) defines every record and every field value that
  this page used.
