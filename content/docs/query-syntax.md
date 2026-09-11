---
title: Query syntax
description: Search and filter records with the query language that every list page uses.
group: Finding things
weight: 200
---

Every list page takes the same query language. Type a word to search text, or
type `field:value` to filter on a field. You can combine as many words and
filters as you need. Sepal joins the terms with AND, so a record has to match
every term.

## Words

A word on its own is a full-text search.

```
quercus
```

To match a phrase whole, put the phrase in double quotation marks.

```
"red oak"
```

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

## Comparisons

Four comparison operators work on dates and numbers.

```
created:>2024-01-01
created:>=2024-01-01
updated:<2024-06-01
updated:<=2024-06-01
```

## Negation

A leading `-` excludes. It works on a word and on a filter.

```
-quercus
-location:GH
```

A negated field name with no value excludes records where that field is true.

```
-private
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

{{< note >}}
This page describes the language rather than the field list of every resource.
The grammar in the app is the source of truth for both. If a query that this
page shows does not work, report it.
{{< /note >}}
