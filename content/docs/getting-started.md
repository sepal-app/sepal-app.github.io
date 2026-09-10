---
title: Getting started
description: The four records Sepal is built on, and how to create your first accession.
weight: 10
---

Sepal keeps track of plants. Four record types carry almost everything, and they
nest inside each other. Learn those four and the rest of the app follows.

## The four records

A **taxon** is a name. *Quercus alba*, *Acer*, Rosaceae. Sepal ships the World
Flora Online Plantlist, so most names you need already exist and you search for
them rather than typing them.

An **accession** is one arrival of one taxon. A batch of seed from a collecting
trip, a plant bought from a nursery, a cutting sent by another garden. It has a
code you choose, and it points at a taxon. That is all Sepal requires; provenance,
supplier, and the dates received and accessioned are optional.

A **material** is the living stuff of an accession, in one place, counted. One
accession of twenty seeds sown into two flats in two greenhouses is two
materials. A material points at its accession and at a location, and carries a
type, a status and a quantity.

A **location** is where material sits. A greenhouse, a bed, a shelf, a field.

Read the chain in one line: a location holds material, material belongs to an
accession, an accession is of a taxon.

## Why the split

The split is what lets one record answer questions the other cannot. The
accession answers "where did this come from, and when" once, for the whole
arrival. The material answers "how many are alive, and where are they" for each
part of it, and keeps answering as plants are moved, propagated and lost.

Merge the two and you either lose the provenance when the last plant dies, or
you copy it onto every row and it drifts.

## Create your first accession

You need a taxon before you can create an accession, and a location before you
can create material.

1. Open **Locations** and add the place your plant is. A code and a name are
   enough.
2. Open **Accessions** and start a new one.
3. Enter a code. Sepal does not impose a format. Gardens commonly use the year
   and a serial, `2026.0001`, but anything unique to you works.
4. Search for the taxon and select it.
5. Save. You now have an accession with no material, which is a real state: the
   arrival is recorded and nothing has been planted yet.
6. Open the accession and add material. Choose the location, set the type,
   the status and the quantity.

The accession is now findable by its code, by its taxon and by the location of
its material.

## Provenance

Provenance is optional and worth setting. It records how the plant came to be
where it is, and it is one of:

| Value | Meaning |
|---|---|
| Wild | Collected from a wild population |
| Cultivated | Taken from a cultivated plant |
| Not wild | Known not to be of wild origin |
| Purchase | Bought, with origin unrecorded |
| Insufficient data | Not known |

For wild material a second field records whether the population was native
where it was collected.

## Material type and status

Type says what the material is: **plant**, **seed**, **vegetative**, **tissue**
or **other**.

Status says what became of it: **alive**, **dead**, **dormant**,
**transferred**, **other** or **unknown**. Moving material between locations and
changing its quantity is recorded, so the count you see is the current one and
the history behind it stays.

{{< note >}}
Some search filters offer only alive and dead as status choices. That is a
shorthand for the search, not the complete list above.
{{< /note >}}

## What to read next

- [Query syntax](/docs/query-syntax/) — finding records once you have more than
  a screenful.
- [Self-hosting](/docs/self-hosting/) — running Sepal on your own machine.
