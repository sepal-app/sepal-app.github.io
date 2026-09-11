---
title: Query syntax
description: Search and filter records with the query language that every list page uses.
group: Finding things
weight: 200
---

Five lists take the same query language: **Accessions**, **Material**,
**Locations**, **Taxa**, and **Contacts**. Type a word to search text, or type
`field:value` to filter on a field. You can combine as many words and
filters as you need. Sepal joins the terms with AND, so a record has to match
every term.

## Words

A word on its own is a full-text search.

```
quercus
```

Quotation marks around a bare search do not hold the words together. Sepal
searches each word on its own, so `"red oak"` matches the same records as
`red oak` does, including a record that has the two words far apart or in the
other order.

## Filters

A `field:value` term filters on one field.

```
taxon:Quercus
```

If a value contains a space, put the value in double quotation marks.

```
taxon:"Quercus alba"
```

To match any one of several values, separate the values with commas.

```
location:GH,SH
```

Commas mean OR. The query above matches material in `GH` or in `SH`. Commas
only widen a single field. Two different fields still narrow each other.

```
taxon:Quercus location:GH,SH
```

That query matches an oak in one of those two locations.

## How a text filter matches

A text filter with no operator matches a substring. `location:GH` finds a
location coded `GH`, and it also finds one coded `GH2`, because Sepal compiles
the term to `LIKE '%GH%'`.

A comma-separated list matches exactly. `location:GH,SH` compiles to
`IN ('GH', 'SH')`, so it finds `GH` and `SH` and no longer finds `GH2`. A comma
widens how many values a field accepts and narrows how each one matches, which
means a comma list can return fewer rows than the single-value term it grew out
of.

To match one value exactly, put `=` in front of it.

```
location:=GH
```

That finds `GH` and not `GH2`.

Only text filters work this way. A date, an enum, and an ID filter are exact
already. A full-text filter matches on whole words rather than on substrings,
and it ignores an `=` placed in front of its value.

## Comparisons

Four comparison operators work on dates.

```
created:>2024-01-01
created:>=2024-01-01
updated:<2024-06-01
updated:<=2024-06-01
```

## Negation

A leading `-` excludes a filter.

```
-location:GH
```

## Nested fields

A dot in a field name reaches through a relationship.

```
taxon.rank:species
material.status:alive
```

## Putting it together

```
quercus location:GH,SH material.status:alive created:>2026-01-01
```

That query matches oaks with living material in `GH` or `SH`, and it matches
only records created after January 1, 2026.

## Which fields exist

The fields differ by list page. An accession takes `code`, `taxon`,
`taxon.rank`, `provenance`, `supplier`, `location`, `material.type`,
`material.status`, `tag`, `created`, and `updated`. A few more fields exist as
`.id` variants, which match a record by its numeric ID rather than by its name.
Each list page offers its own fields in the **Filter** dropdown beside the
search box.

A filter naming a field that the list does not have is dropped rather than
matching nothing, so a misspelled field name widens the result instead of
narrowing it. If a term seems to do nothing, check its spelling against the list
above.

{{< note >}}
This page describes the language rather than the field list of every resource.
The grammar in the app is the source of truth for both. If a query that this
page shows does not work, report it.
{{< /note >}}
