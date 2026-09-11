---
title: Glossary
description: The records, fields, and values that the rest of the documentation refers to.
group: Reference
weight: 400
---

Sepal is built on four records that nest inside each other. A location holds
material, a material belongs to an accession, and an accession points at a
taxon. This page defines those four records and the other terms that the task
pages use.

## Accession

An accession is one arrival of one taxon. Each of the following is one
accession:

- A batch of seed from a collecting trip.
- A plant bought from a nursery.
- A cutting sent by another garden.

An accession needs a **Code** that you choose and a **Taxon**. Sepal requires
nothing else. The provenance, the supplier, the intended location, and the dates
received and accessioned are all optional. Sepal does not impose a format on the
code. Gardens commonly use the year and a serial number, such as `2026.0001`,
but any code that is unique to you works.

## Activity

An activity is one recorded change to a record, together with the user who made
it and the time it happened. Sepal writes an activity when you create or update
an accession, a material, a location, or a taxon. The **Activity** section lists
them for the whole collection, and each record's panel has an **Activity**
section of its own.

## Contact

A contact is a person or an organization that your collection deals with, such
as a nursery, another garden, or a collector. An accession's **Supplier** field
points at a contact.

## Location

A location is a place that holds material, such as a greenhouse, a bed, a shelf,
or a field. A location needs a **Name** and a **Code**, each at least two
characters, and it takes an optional **Description**.

## Material

A material is a quantity of an accession at one location. If you sow twenty
seeds from one accession into two flats in two greenhouses, you have two
materials. A material needs a **Code**, an **Accession**, a **Location**, a
**Type**, a **Status**, and a **Quantity**.

Sepal records each move between locations and each change in quantity. The
quantity you see is the current one, and the history of those changes stays on
the record.

### Material type

The type of a material records what the material is. The values are **plant**,
**seed**, **vegetative**, **tissue**, and **other**.

### Material status

The status of a material records what became of it. The values are **alive**,
**dead**, **dormant**, **transferred**, **other**, and **unknown**. A material
whose status is **dead**, **transferred**, or **other** has to have a quantity
of zero, because a lot that is no longer current cannot hold plants.

{{< note >}}
Some search filters offer only alive and dead as status choices. Those two
values are a shorthand for the search. They are not the complete list of
statuses.
{{< /note >}}

## Provenance

Provenance records how a plant came to be where it is. It is an optional field
on an accession, and it is worth setting. Set **Provenance Type** to one of the
following values:

| Value | Meaning |
|---|---|
| Wild | Collected from a wild population |
| Cultivated | Taken from a cultivated plant |
| Not wild | Known not to be of wild origin |
| Purchase | Bought, with origin unrecorded |
| Insufficient data | Not known |

For wild material, **Wild Provenance Status** records whether the population was
native where it was collected.

## Tag

A tag is a label that you attach to records so that you can find them together.
A tag has a name and an optional description, and you can apply one to an
accession, a material, or a taxon.

## Taxon

A taxon is a botanical name at any rank, such as the species *Quercus alba* or
the genus *Acer*. The setup wizard offers to import the World Flora Online
Plantlist, so most instances already hold the names you need, and an instance
that skipped it starts with none. You search for a name instead of typing it.

## Why accessions and materials are separate

An accession records where a plant came from and when it arrived. It records
that once, for the whole arrival. A material records how many plants are alive
and where they are. Sepal updates the material as plants are moved, propagated,
and lost.

One record cannot do both jobs. If Sepal stored the provenance on the record
that tracks living plants, the provenance would disappear when the last plant
died. Storing a copy of the provenance on every row would create duplicates that
drift apart.

## Further reading

Managing a plant collection is a practice with its own published guidance, and
that guidance is independent of any one piece of software. The reference below
describes the practice rather than Sepal.

- [Guide to Accessioning Living Collections](https://www.bgci.org/resources/bgci-tools-and-resources/guide-to-accessioning-living-collections/),
  published by Botanic Gardens Conservation International (BGCI).
