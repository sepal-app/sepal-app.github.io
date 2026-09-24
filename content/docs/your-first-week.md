---
title: Your first week
description: Follow one arrival from an empty database to a planted, moved, and findable record.
group: Getting started
weight: 20
steps: true
---

This page follows one arrival through Sepal. You add the place it will live,
record the arrival, plant it, move it, and then find it again.

You need an account on a Sepal instance with the [editor or admin
role](/docs/users/#choose-a-role). If you are running Sepal yourself,
[Self-hosting](/docs/self-hosting/) describes how to start one.

## Add a location

A [location](/docs/glossary/#location) is a place that holds plants. Every
material is filed in a location, so add the location first.

1. Select **Locations** in the sidebar.
2. Select **Create**.
3. Enter a **Name** and a **Code**. Both are required and both have to be at
   least two characters. The name is what you call the place, such as
   `Greenhouse 2`. The code is the short form that appears next to material,
   such as `GH2`.
4. Enter a **Description** if the name needs explaining. The field is optional.
5. Select **Save**.

Add one location for each place you want to tell apart. If you want to know
which shelf in a greenhouse a plant is on, give each shelf its own location.

## Record the arrival as an accession

An [accession](/docs/glossary/#accession) is one arrival of one
[taxon](/docs/glossary/#taxon). Record it while you still have the label and
the paperwork in front of you.

1. Select **Accessions** in the sidebar.
2. Select **New accession**.
3. Under **Identity**, check the **Code**. Sepal fills it in with the next code
   in your garden's sequence, such as `2026.0001`. You can keep it or type your
   own, and the code has to be unique.
4. Start typing a name in the **Taxon** field and select the name you want from
   the results. The field searches the taxa your instance holds, so you rarely
   have to add a name yourself.
5. Under **Provenance**, set **Provenance Type** to record how the plant came to
   be where it is. The field is optional. The
   [glossary](/docs/glossary/#provenance) lists the five values and what each
   one means.
6. If the provenance is wild, set **Wild Provenance Status** as well.
7. Set **Supplier** if the plant came from a nursery, a garden, or a collector
   that you have recorded as a [contact](/docs/glossary/#contact).
8. Under **Placement**, set **Intended location** to the location you added.
   Leave it empty if the bed is not decided yet.
9. Under **Receipt**, set **Date Received** and **Date Accessioned** if you know
   them, and record what arrived in **Received as** and **Quantity received**.
   All four fields are optional.
10. Select **Save**.

The accession now has no material. That is a valid state: the arrival is
recorded and nothing has been planted yet.

## Plant material into the location

A [material](/docs/glossary/#material) is a quantity of the accession at one
location. Planting the accession means creating its first material.

If you set an **Intended location** in the previous step, start from the
location:

1. Select **Locations** in the sidebar and open the location.
2. Open the **Awaiting planting** section of the panel. The accession is listed
   there.
3. Select **Plant here**. The material form opens with **Accession** and
   **Code** already filled in.

If you left **Intended location** empty, open the accession, select
**Actions**, and select **Add material**.

Then fill in the rest of the form:

1. Under **Identity**, check the **Code**. Sepal identifies a material by the
   accession code and the material code together, so the suggested code is
   short, such as `1`.
2. Choose the **Location** you are planting into. When the accession has an
   intended location, the hint under the field names it.
3. Under **Holding**, set the **Quantity** to the number of seeds or plants
   that this material holds.
4. Set **Status** to **alive** for a new planting.
5. Set **Type** to what you are holding: **plant**, **seed**, **vegetative**,
   **tissue**, or **other**.
6. Select **Save**.

When part of an accession goes somewhere else, create a second material for it.
For example, twenty seeds sown into two greenhouses are recorded as two
materials.

## Move the material

Sepal keeps a history of every move and every change in quantity. Record each
one with a reason, so that the history says why it happened.

1. Select **Material** in the sidebar and open the material.
2. On the **General** tab, change **Location** to the new place.
3. Set **Reason for change**.
4. Select **Save**.

The move appears in the **History** section of the material's panel, newest
first. To move only part of a material, see [Move material to another
location](/docs/material-and-locations/#move-material-to-another-location).

## Find the record again

Every list page has the same search box. It takes words and field filters
together.

1. Select **Accessions** in the sidebar.
2. Type the accession code, such as `2026.0001`, or the start of the taxon
   name.
3. Select the row. The panel shows the summary, and the **Statistics** section
   links to the material that belongs to the accession.

To find plants by where they are, select **Material** and filter on a location.

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
