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

The examples on this page assume the **Accessions** list, except where a section
names another one. The fields differ by list, and [Which fields
exist](#which-fields-exist) gives each list its own.

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

Commas mean OR. The query above matches an accession with material in `GH` or
in `SH`. Commas only widen a single field. Two different fields still narrow
each other.

```
taxon:Quercus location:GH,SH
```

That query matches an oak in one of those two locations.

## How a text filter matches

A text filter with no operator matches a substring. `location:GH` matches a
location coded `GH`, and it also matches one coded `GH2`, because Sepal compiles
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

Only a `text` field works this way. [Field types](#field-types) gives the
matching rule and the operators for every type.

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

The fields differ by list. Every field has a type, and the type decides how a
value matches and which operators the field honours. The name of the field
makes no difference.

A filter naming a field that its list does not have is dropped rather than
matching nothing, so a misspelled field name widens the result instead of
narrowing it. If a term appears to do nothing, check its spelling against the
table for the list you are on.

### Field types

| Type | What a value matches | Operators |
|---|---|---|
| `text` | Any part of the stored value, as `LIKE '%value%'` | `=` matches the whole value exactly |
| `fts` | Whole words, with the last word matched as a prefix | None. Sepal ignores an `=` in front of the value |
| `enum` | One value from a fixed set, matched exactly | None |
| `id` | A record's numeric ID, matched exactly | None |
| `date` | A date, matched exactly | `>`, `>=`, `<`, and `<=` |
| `count` | The number of related records | `>`, `>=`, `<`, and `<=` |

Sepal reads a comma-separated list before it reads the type, so `field:a,b`
compiles to `IN ('a', 'b')` whichever type the field has. That is why
`location:GH,SH` matches each value exactly where `location:GH` matches a
substring.

An ID field matches a record by its numeric ID rather than by its name. You can
type one into the search box, though the **Filter** dropdown does not offer it.

### Accessions

| Field | Type |
|---|---|
| `code` | `fts` |
| `id` | `id` |
| `provenance` | `enum` |
| `taxon` | `fts` |
| `taxon.id` | `id` |
| `taxon.rank` | `enum` |
| `supplier` | `text` |
| `supplier.id` | `id` |
| `location` | `text` |
| `location.id` | `id` |
| `material.type` | `enum` |
| `material.status` | `enum` |
| `tag` | `text` |
| `created` | `date` |
| `updated` | `date` |

### Material

| Field | Type |
|---|---|
| `code` | `text` |
| `type` | `enum` |
| `status` | `enum` |
| `id` | `id` |
| `accession` | `text` |
| `accession.id` | `id` |
| `taxon` | `fts` |
| `taxon.id` | `id` |
| `location.code` | `text` |
| `location.name` | `text` |
| `location.id` | `id` |
| `tag` | `text` |
| `created` | `date` |
| `updated` | `date` |

### Locations

| Field | Type |
|---|---|
| `code` | `fts` |
| `name` | `fts` |
| `description` | `fts` |
| `id` | `id` |
| `taxon` | `fts` |
| `taxon.id` | `id` |
| `material.type` | `enum` |
| `material.status` | `enum` |
| `created` | `date` |
| `updated` | `date` |

The `taxon` field on this list asks what a location holds, so `taxon:Quercus`
finds the locations that hold an oak.

### Taxa

| Field | Type |
|---|---|
| `name` | `fts` |
| `author` | `text` |
| `rank` | `enum` |
| `id` | `id` |
| `parent` | `text` |
| `parent.id` | `id` |
| `material.type` | `enum` |
| `material.status` | `enum` |
| `location.code` | `text` |
| `location.name` | `text` |
| `location.id` | `id` |
| `accessions` | `count` |
| `tag` | `text` |
| `synonym` | `text` |

The `accessions` field counts the accessions of a taxon. `accessions:>0` finds
the taxa you hold, and `accessions:0` finds the ones you do not. The **Only taxa
with accessions** checkbox above the table writes `accessions:>0` for you.

The `synonym` field is the exception to the type table. Sepal resolves the
value against the synonyms it knows and returns the taxa those names point to,
rather than matching a column.

### Contacts

| Field | Type |
|---|---|
| `name` | `fts` |
| `email` | `fts` |
| `business` | `fts` |
| `address` | `text` |
| `id` | `id` |
| `created` | `date` |
| `updated` | `date` |

{{< note >}}
The search grammar in the app is the source of truth for both the language and
the fields. If a query that this page shows does not work, report it.
{{< /note >}}
