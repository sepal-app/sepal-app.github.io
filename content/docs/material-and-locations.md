---
title: Track material and locations
description: Create locations, plant material into them, and keep the quantity and the moves on the record.
group: The collection
weight: 310
---

A [location](/docs/glossary/#location) is a place that holds plants, and a
[material](/docs/glossary/#material) is a quantity of an
[accession](/docs/glossary/#accession) at one location. This page describes both
records, the values their fields take, and the history Sepal keeps as material
moves.

## Create a location

Add the location before you plant anything into it. Sepal will not let you
create material in a location that does not exist yet.

1. Select **Locations** in the sidebar.
2. Select **Create**.
3. Enter a **Name**, such as `Greenhouse 2`. The name is what you call the
   place.
4. Enter a **Code**, such as `GH2`. The code is the short form that appears
   beside material in lists.
5. Enter a **Description** if the name needs explaining. The field is optional.
6. Select **Save**.

Both the name and the code are required, and each has to be at least two
characters. Add one location for each place you want to tell apart, down to the
shelf if you want to know which shelf a plant is on.

## Edit a location

Open a location from the **Locations** list. An editor sees the same three
fields as the create form, and a reader sees the summary panel instead. Change
what you need and select **Save**, or select **Cancel** to reload the record as
it was.

The app has no control that deletes a location. A material refers to its
location rather than carrying a copy of the name, so renaming a location changes
what every material in it reports.

## Create material

Start from the location when the accession already names it as its **Intended
location**:

1. Select **Locations** in the sidebar and open the location.
2. Open the **Awaiting planting** section of the panel.
3. Select **Plant here** beside the accession. The material form opens with
   **Accession** already filled in.

Otherwise, select **Material** in the sidebar, select **Create**, and choose the
accession in the **Accession** field.

Either way, fill in the rest of the form:

1. Under **Identity**, enter a **Code**. Sepal identifies a material by the
   accession code and the material code together, so a code as short as `1` is
   enough.
2. Check that **Location** names the place you are planting into.
3. Under **Holding**, set the **Quantity** to the number of seeds or plants this
   material holds. A new material has to start with at least one.
4. Set **Status** and **Type**.
5. Select **Save**.

Create a second material for the same accession whenever part of it goes
somewhere else. Twenty seeds sown into two greenhouses are two materials.

## Choose a type and a status

**Type** records what the material is. It takes one of `plant`, `seed`,
`vegetative`, `tissue`, and `other`. Set it to what you are holding now rather
than to what the material will become.

**Status** records what became of the material. It takes one of `alive`, `dead`,
`dormant`, `transferred`, `other`, and `unknown`. Sepal splits the six into two
groups. A material that is `alive`, `dormant`, or `unknown` is current and can
hold any number of plants. A material that is `dead`, `transferred`, or `other`
is no longer current and has to have a quantity of zero, because a lot that is
no longer current cannot hold plants. Reduce the quantity in the same save that
changes the status.

{{< note >}}
Some search filters offer only `alive` and `dead` as status choices. Those two
values are a shorthand for the search rather than the complete list.
{{< /note >}}

## Change the quantity

Record a change in the app rather than editing the number and moving on. Sepal
writes a history row for the change and keeps it on the record.

1. Select **Material** in the sidebar and open the material.
2. On the **General** tab, set **Quantity** to the new number.
3. Set **Reason for change**. The field lists `Dead`, `Deleted, year dead
   unknown`, `Did not germinate`, `Discarded`, `Discarded seedling`, `Discarded,
   weedy`, `Distributed elsewhere`, `Error correction`, `Given away`, `Lost,
   whereabouts unknown`, `Other`, `Stolen`, `Summer kill`, `Transferred
   elsewhere`, and `Winter kill`. It starts on `None`.
4. Select **Save**.

The reason is stored on the history row rather than on the material, so it is
recorded only when the quantity or the location actually changed. A save that
changes neither records nothing, whatever the reason field says.

## Move material to another location

To move a whole material:

1. Open the material and stay on the **General** tab.
2. Change **Location** to the new place.
3. Set **Reason for change**.
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

The second material carries its own code, so the accession now has two lots you
can count separately.

## Read the change history

The **History** section of the material's panel lists the changes, newest first.
Each entry shows the date and time, the change in quantity as a signed number,
the move, and the reason if you set one. A move reads as the old location and
the new one. A change with no move reads as `quantity change`.

The section shows the three most recent entries, and a **Show all** button
appears when there are more.

Sepal writes a history entry when a material moves between locations or its
quantity changes. Creating a material does not write one, and neither does
changing its code, its type, or its status on its own.

## How a location relates to its material

A location holds material rather than holding accessions. Open a location and
its panel reports three things.

- **Statistics** counts the materials in the location and links to them in the
  **Material** list.
- **Awaiting planting** lists the accessions whose **Intended location** is this
  place and which have nothing planted here yet. Each row carries a **Plant
  here** link. An accession leaves the section as soon as it has material in the
  location.
- **Moved** lists the material that has left this location, newest first, with
  the date and the place it went to.

To see everything currently in a location, filter the **Material** list by the
location code.

```
location.code:GH2 status:alive
```

## What to read next

- [Add and edit accessions](/docs/accessions/) describes the record that
  material belongs to.
- [Search your collection](/docs/search/) describes how to find material by
  where it is rather than by what it is.
- [Glossary](/docs/glossary/) defines every record and every field value that
  this page used.
