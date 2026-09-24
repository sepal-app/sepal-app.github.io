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

Creating, editing, moving, archiving, and deleting material and locations needs
the [editor or admin role](/docs/users/#choose-a-role). A reader who opens a
material or a location sees a read-only page that holds its panel, without the
form or the tabs.

## Create a location

Every material is filed in a location, so add the location before you plant
anything into it.

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

Open a location from the **Locations** list. The **General** tab holds the
same three fields as the create form. Change what you need and select **Save**, or select **Cancel** to reload the record as
it was.

A material refers to its location and does not keep a copy of the name, so
renaming a location changes what every material in it reports.

## Archive or delete a location

A location that has ever held material cannot be deleted, because the material
history names it as the place plants moved from or to. Archive it instead.

1. Open the location and stay on the **General** tab.
2. Select **Actions**, then select **Archive**.
3. Select **Archive** in the confirmation.

Sepal refuses to archive a location that still holds material, so move the
material somewhere else first. An archived location keeps its place in the
history, and it no longer appears in the **Locations** list or in the
**Location** field of the material form. To list archived locations, search for
`archived:true`. To bring one back, open it, select **Actions**, and select
**Restore**.

**Delete** in the same menu removes a location that holds no material, appears
in no material's history, and is not named by a propagation. You cannot undo a
delete.

## Create material

Start from the location when the accession already names it as its **Intended
location**:

1. Select **Locations** in the sidebar and open the location.
2. Open the **Awaiting planting** section of the panel.
3. Select **Plant here** beside the accession. The material form opens with
   **Accession** and **Code** already filled in.

To start from the accession, open it, select **Actions**, and select **Add
material**. To start from nothing, select **Material** in the sidebar, select
**Create**, and choose the accession in the **Accession** field.

Then fill in the rest of the form:

1. Under **Identity**, check the **Code**. Sepal fills it in with the next code
   for the accession once the accession is set. Sepal identifies a material by
   the accession code and the material code together, so a code as short as `1`
   is enough.
2. Choose the **Location** you are planting into. When the accession has an
   intended location, the hint under the field names it.
3. Under **Holding**, set the **Quantity** to the number of seeds or plants this
   material holds. A new material has to start with at least one.
4. Set **Status** and **Type**.
5. Select **Save**.

When part of an accession goes somewhere else, create a second material for it.
For example, twenty seeds sown into two greenhouses are recorded as two
materials.

## Choose a type and a status

**Type** records what the material is. It takes one of `plant`, `seed`,
`vegetative`, `tissue`, and `other`. Set it to what you are holding now, not to
what the material will become.

**Status** records what became of the material. It takes one of `alive`, `dead`,
`dormant`, `transferred`, `other`, and `unknown`. A material that is `alive`,
`dormant`, or `unknown` is current and can hold any number of plants. A material
that is `dead`, `transferred`, or `other` is no longer current, and Sepal
requires its quantity to be zero. Set the quantity to zero in the same save that
changes the status.

## Change the quantity

When the number of plants changes, record the change with a reason.

1. Select **Material** in the sidebar and open the material.
2. On the **General** tab, set **Quantity** to the new number.
3. Set **Reason for change**. The field lists `Dead`, `Deleted, year dead
   unknown`, `Did not germinate`, `Discarded`, `Discarded seedling`, `Discarded,
   weedy`, `Distributed elsewhere`, `Divided`, `Error correction`, `Given away`,
   `Lost, whereabouts unknown`, `Other`, `Stolen`, `Summer kill`, `Transferred
   elsewhere`, and `Winter kill`. It starts on `None`.
4. Select **Save**.

Sepal stores the reason on the history entry, not on the material. It records
the reason only when the quantity or the location actually changed. A save that
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
3. Choose the same **Accession**, and choose the **Location** the plants moved
   to.
4. Enter the **Quantity** that moved, set **Status** and **Type**, and select
   **Save**.

The second material carries its own code, so you can count the two lots
separately.

## Read the change history

The **History** section of the material's panel lists the changes, newest first.
Each entry shows the date and time, the change in quantity as a signed number,
the move, and the reason if you set one. A move reads as the old location and
the new one. A change with no move reads as `quantity change`.

The section shows the three most recent entries. When there are more, a **Show
all** button lists the rest.

Sepal writes a history entry when a material moves between locations or its
quantity changes. Creating a material does not write one, and neither does
changing only its code, its type, or its status.

## Delete material

Open the material, select **Actions**, and select **Delete**. Sepal refuses to
delete a material that a propagation names as its parent plant. Deleting a
material also removes its history, its observations, and its tags, and it
unlinks its media. You cannot undo a delete.

## How a location relates to its material

A location holds material, not accessions. Open a location and its panel shows
the following sections:

- **Statistics** counts the materials in the location and links to them in the
  **Material** list.
- **Awaiting planting** lists the accessions whose **Intended location** is this
  place and which have nothing planted here yet. Each row carries a **Plant
  here** link. An accession leaves the section as soon as it has material in the
  location.
- **Moved** lists the material that has left this location, newest first, with
  the date and the place it went to.
- **Propagation** lists the propagations running in this location.

To see everything currently in a location, filter the **Material** list by the
location code.

```
location.code:GH2 status:alive
```

## What to read next

- [Add and edit accessions](/docs/accessions/) describes the record that
  material belongs to.
- [Search your collection](/docs/search/) describes how to find material by
  where it is.
- [Glossary](/docs/glossary/) defines every record and every field value that
  this page used.
