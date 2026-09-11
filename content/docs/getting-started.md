---
title: Getting started
description: Learn the four records that Sepal is built on, and create your first accession.
weight: 10
---

Sepal keeps track of plants. Four record types carry almost everything in the
app, and they nest inside each other. After you learn these four, the rest of
the app is easier to follow.

## The four records

A **taxon** is a botanical name at any rank, such as the species *Quercus alba*
or the genus *Acer*. Sepal ships the World Flora Online Plantlist, so most of
the names you need already exist. You search for a name instead of typing it.

An **accession** is one arrival of one taxon. For example, an accession can be
any of the following:

- A batch of seed from a collecting trip.
- A plant bought from a nursery.
- A cutting sent by another garden.

An accession has a code that you choose, and it points at a taxon. Sepal
requires nothing else. Provenance, supplier, and the dates received and
accessioned are optional.

A **material** is a quantity of an accession at one location. If you sow twenty
seeds from one accession into two flats in two greenhouses, you have two
materials. A material points at its accession and at a location. It also carries
a code, a type, a status, and a quantity.

A **location** is a place that holds material, such as a greenhouse, a bed, a
shelf, or a field.

The four records form a chain:

- A location holds material.
- A material belongs to an accession.
- An accession points at a taxon.

## Why accessions and materials are separate

An accession records where a plant came from and when it arrived. It records
that once, for the whole arrival. A material records how many plants are alive
and where they are. Sepal updates the material as plants are moved, propagated,
and lost.

One record cannot do both jobs. If Sepal stored the provenance on the record
that tracks living plants, the provenance would disappear when the last plant
died. Storing a copy of the provenance on every row would create duplicates
that drift apart.

## Create your first accession

You need a taxon before you can create an accession, and you need a location
before you can create material.

1. Open **Locations** and add the place your plant is. A code and a name are
   enough.
2. Open **Accessions** and start a new one.
3. Enter a code. Sepal does not impose a format. Gardens commonly use the year
   and a serial number, such as `2026.0001`, but any code that is unique to you
   works.
4. Search for the taxon and select it.
5. Save the accession. The accession now has no material, and that is a valid
   state. The arrival is recorded, and nothing has been planted yet.
6. Open the accession and add material. Enter a code, choose the location, and
   set the type, the status, and the quantity.

You can now find the accession by its code, by its taxon, or by the location of
its material.

## Provenance

Provenance is an optional field on an accession, and it is worth setting. It
records how the plant came to be where it is. Set it to one of the following
values:

| Value | Meaning |
|---|---|
| Wild | Collected from a wild population |
| Cultivated | Taken from a cultivated plant |
| Not wild | Known not to be of wild origin |
| Purchase | Bought, with origin unrecorded |
| Insufficient data | Not known |

For wild material, a second field records whether the population was native
where it was collected.

## Material type and status

The type of a material records what the material is. The values are **plant**,
**seed**, **vegetative**, **tissue**, and **other**.

The status of a material records what became of it. The values are **alive**,
**dead**, **dormant**, **transferred**, **other**, and **unknown**. Sepal
records each move between locations and each change in quantity. The quantity
you see is the current one, and the history of those changes remains.

{{< note >}}
Some search filters offer only alive and dead as status choices. Those two
values are a shorthand for the search. They are not the complete list of
statuses.
{{< /note >}}

## What to read next

- [Query syntax](/docs/query-syntax/) describes how to find records once you
  have more than a screenful.
- [Self-hosting](/docs/self-hosting/) describes how to run Sepal on your own
  machine.
