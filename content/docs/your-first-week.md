---
title: Your first week
description: Follow one arrival from an empty database to a planted, moved, and findable record.
group: Getting started
weight: 20
steps: true
---

This page follows one arrival all the way through Sepal: you add the place it
will live, record the arrival, plant it, move part of it, and then find it
again. Work through it once with a real plant and you will have used every
record the app is built on.

You need an account on a Sepal instance and permission to create records. If you
are running Sepal yourself, [Self-hosting](/docs/self-hosting/) describes how to
start one.

## Add a location

A [location](/docs/glossary/#location) is a place that holds plants. Add it
before you record the arrival, because Sepal will not let you plant anything
into a location that does not exist yet.

1. Select **Locations** in the sidebar.
2. Select **Create**.
3. Enter a **Name** and a **Code**. Both are required and both have to be at
   least two characters. The name is what you call the place, such as
   `Greenhouse 2`. The code is the short form that appears next to material,
   such as `GH2`.
4. Enter a **Description** if the name needs explaining. The field is optional.
5. Select **Save**.

Add one location for each place you want to tell apart. A shelf inside a
greenhouse is worth its own location if you want to know which shelf a plant is
on.

## Record the arrival as an accession

An [accession](/docs/glossary/#accession) is one arrival of one
[taxon](/docs/glossary/#taxon). Record it as soon as the plant reaches you,
while you still have the label and the paperwork in front of you.

1. Select **Accessions** in the sidebar.
2. Select **New accession**.
3. Under **Identity**, enter a **Code**. Sepal does not impose a format, and the
   code has to be unique. Gardens commonly use the year and a serial number,
   such as `2026.0001`.
4. Start typing a name in the **Taxon** field and select the name you want from
   the results. Sepal searches the World Flora Online Plantlist, so you rarely
   have to add a name yourself.
5. Under **Provenance**, set **Provenance Type**. The field is optional, and it
   is worth setting, because it records how the plant came to be where it is.
   The [glossary](/docs/glossary/#provenance) lists the five values and what
   each one means.
6. If the provenance is wild, set **Wild Provenance Status** as well.
7. Set **Supplier** if the plant came from a nursery, a garden, or a collector
   that you have recorded as a [contact](/docs/glossary/#contact).
8. Under **Placement**, set **Intended location** to the location you added.
   Leave it empty if the bed is not decided yet. Setting it makes the next step
   shorter.
9. Under **Dates**, set **Date Received** and **Date Accessioned** if you know
   them. Both are optional.
10. Select **Save**.

The accession now has no material, and that is a valid state. The arrival is
recorded and nothing has been planted yet.

## Plant material into the location

A [material](/docs/glossary/#material) is a quantity of the accession at one
location. Planting the accession means creating its first material.

If you set an **Intended location** in the previous step, start from the
location:

1. Select **Locations** in the sidebar and open the location.
2. Open the **Awaiting planting** section of the panel. The accession is listed
   there.
3. Select **Plant here**. The material form opens with **Accession** already
   filled in.

If you left **Intended location** empty, select **Material** in the sidebar,
select **Create**, and choose the accession in the **Accession** field instead.

Then fill in the rest of the form:

1. Under **Identity**, enter a **Code**. Sepal identifies a material by the
   accession code and the material code together, so a code as short as `1` is
   enough.
2. Check that **Location** names the place you are planting into.
3. Under **Holding**, set the **Quantity** to the number of seeds or plants
   that this material holds.
4. Set **Status** to **alive** for a new planting.
5. Set **Type** to what you are holding: **plant**, **seed**, **vegetative**,
   **tissue**, or **other**.
6. Select **Save**.

Create a second material for the same accession whenever part of it goes
somewhere else. Twenty seeds sown into two greenhouses are two materials.

## Move or split the material

Sepal keeps a history of every move and every change in quantity, so record
these in the app rather than editing the number and forgetting why.

To move the whole material to another location:

1. Select **Material** in the sidebar and open the material.
2. On the **General** tab, change **Location** to the new place.
3. Set **Reason for change**. Sepal records the reason in the material's history
   along with the move.
4. Select **Save**.

To split a material between two locations, reduce the first and create the
second:

1. Open the material, reduce **Quantity** to the number that stays, set a
   **Reason for change**, and select **Save**.
2. Select **Material** in the sidebar, then select **Create**.
3. Enter a **Code**, choose the same **Accession**, and choose the location the
   plants moved to.
4. Enter the **Quantity** that moved, set **Status** and **Type**, and select
   **Save**.

Both changes appear in the **History** section of the material's panel, newest
first. The section shows the three most recent changes, and a **Show all** button
appears when there are more.

## Find the record again

Every list page takes the same search box, and it searches text and filters
fields at the same time.

1. Select **Accessions** in the sidebar.
2. Type the accession code, such as `2026.0001`. A bare word on this list
   matches the code, so search by name with `taxon:` instead.
3. Select the row. The panel shows the summary, and the **Statistics** section
   links to the material that belongs to the accession.

To find plants by where they are rather than by what they are, select
**Material** and filter on a location.

```
location.code:GH2 status:alive
```

Select **Filter** beside the search box to build a term from the fields that
list carries.
[Query syntax](/docs/query-syntax/) describes the whole language, including
comparisons, negation, and matching several values at once.

## What to read next

- [Glossary](/docs/glossary/) defines every record and every field value that
  this page used.
- [Query syntax](/docs/query-syntax/) describes how to find records once you
  have more than a screenful.
- [Self-hosting](/docs/self-hosting/) describes how to run Sepal on your own
  machine.
