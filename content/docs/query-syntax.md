---
title: Query syntax
description: The search language used on every list page.
weight: 20
---

Every list page takes the same query language. Type words to search text, or
`field:value` to filter, and combine as many of both as you like. Terms are
joined with AND: every one has to match.

## Words

A bare word is a full-text search.

```
quercus
```

Quote a phrase to match it whole.

```
"red oak"
```

## Filters

`field:value` filters on one field.

```
taxon:Quercus
```

Quote a value that contains a space.

```
taxon:"Quercus alba"
```

Give several values separated by commas to match any of them.

```
location:GH,SH
```

That reads as OR: material in `GH` or in `SH`. Commas only widen a single
field. Two different fields still narrow each other.

```
taxon:Quercus location:GH,SH
```

An oak, in one of those two locations.

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

Negating a bare field name excludes records where that field is true.

```
-private
```

## Nested fields

A dot reaches through a relationship.

```
taxon.rank:species
material.status:alive
```

## Putting it together

```
quercus location:GH,SH material.status:alive -private created:>2026-01-01
```

Oaks, in the north or south greenhouse, alive, not private, accessioned this
year.

## Which fields exist

Fields differ by list page. On an accession, `code`, `taxon`, `taxon.rank`,
`provenance`, `private`, `supplier`, `location`, `material.type`,
`material.status`, `tag`, `created` and `updated` are the ones worth typing;
a few more exist as `.id` variants, matching a record by its numeric id
rather than its name. Each list page shows its own filters as you type.

{{< note >}}
This page describes the language, not the field list of every resource. The
grammar in the app is the source of truth for both. If a query the page shows
does not work, that is worth reporting.
{{< /note >}}
