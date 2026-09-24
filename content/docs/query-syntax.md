---
title: Query syntax
description: Search and filter records with the query language that every list page uses.
group: Finding things
weight: 200
---

Seven lists take the same query language: **Accessions**, **Material**,
**Locations**, **Taxa**, **Contacts**, **Propagation**, and **Observations**.
Type a word to search text, or type
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

Which fields a word searches depends on the list. [Search for a
word](/docs/search/#search-for-a-word) gives them for each list.

Quotation marks around two or more words hold them together as a phrase.
`"red oak"` matches a record where `red` is followed by `oak`, and it does not
match one holding `oak red` or `red maple and oak tree`. Without the quotation
marks, `red oak` matches a record holding both words wherever they sit.

Sepal matches the last word of the whole query as a prefix, and a phrase at the
end of the query takes that prefix on its own last word. A query ending in
`"Quercus alb"` finds `Quercus alba`. A phrase with another term after it has to
match in full.

## Filters

A `field:value` term filters on one field.

```
taxon:Quercus
```

If a value contains a space, put the value in double quotation marks.

```
taxon:"Quercus alba"
```

A quoted value is a phrase on a Full text field, so that filter matches a taxon
named `Quercus alba` and not one named `alba Quercus`.

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

A text filter with no operator matches any part of the stored value.
`location:GH` matches a location coded `GH`, and it also matches one coded
`GH2`.

A comma-separated list matches each value exactly. `location:GH,SH` finds `GH`
and `SH`, and it does not find `GH2`. So adding a second value can return fewer
rows than the single value did.

To match one value exactly, put `=` in front of it.

```
location:=GH
```

That finds `GH` and not `GH2`.

A Full text field takes `=` as well, and matches the whole stored value.
Without it, `code:2022` searches the words in the code. Sepal indexes a code
like `2022.0001` as the two words `2022` and `0001`, so that term returns every
accession of that year. `code:=2022.0001` returns the one accession carrying
that code.

```
code:=2022.0001
```

A Full text field ignores `>`, `>=`, `<`, and `<=`, and searches for the value
as it would without them. [Field types](#field-types) gives the matching rule
and the operators for every type.

## Comparisons

Four comparison operators work on dates.

```
created:>2024-01-01
created:>=2024-01-01
updated:<2024-06-01
updated:<=2024-06-01
```

The colon always separates the field from the value, and the operators in
[Field types](#field-types) are what you can put after it.

## Negation

A leading `-` excludes a filter.

```
-location:GH
```

A leading `-` on a word excludes a full-text term.

```
-quercus
```

That query returns the accessions the search `quercus` leaves out. A phrase
takes a `-` the same way, so `-"red oak"` excludes what `"red oak"` matches.

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
value matches and which operators the field takes. The name of the field makes
no difference.

A filter naming a field that its list does not have is dropped, so a misspelled
field name widens the result instead of narrowing it. If a term appears to do
nothing, check its spelling against the table for the list you are on.

### Field types

| Type | Matches | Operators |
|---|---|---|
| Full text (`fts`) | Whole words, with the last word matched as a prefix | `=` matches the whole stored value. Sepal ignores `>`, `>=`, `<`, and `<=` |
| Text (`text`) | Any part of the stored value | `=` matches the whole value exactly |
| Fixed list (`enum`) | One value from the set the field allows | None. The match is always exact |
| Yes or no (`boolean`) | `true` or `false` | None |
| Date (`date`) | A date, matched exactly | `>`, `>=`, `<`, and `<=` |
| Record ID (`id`) | A record's numeric ID, matched exactly | None. The match is always exact |
| Count (`count`) | The number of related records, matched exactly | `>`, `>=`, `<`, and `<=` |

A comma-separated list matches each value exactly, whatever the field's type.
That is why `location:GH,SH` matches each value exactly and `location:GH`
matches a substring.

A record ID field matches a record by its numeric ID, not by its name. You can
type one into the search box, but the **Filter** dropdown does not offer it. The
dropdown does not offer yes-or-no fields either.

### Accessions

| Field | Type |
|---|---|
| `code` | Full text |
| `id` | Record ID |
| `provenance` | Fixed list |
| `taxon` | Full text |
| `taxon.id` | Record ID |
| `taxon.rank` | Fixed list |
| `supplier` | Text |
| `supplier.id` | Record ID |
| `location` | Text |
| `location.id` | Record ID |
| `material.type` | Fixed list |
| `material.status` | Fixed list |
| `tag` | Text |
| `created` | Date |
| `updated` | Date |

### Material

| Field | Type |
|---|---|
| `code` | Text |
| `type` | Fixed list |
| `status` | Fixed list |
| `id` | Record ID |
| `accession` | Full text |
| `accession.id` | Record ID |
| `taxon` | Full text |
| `taxon.id` | Record ID |
| `location.code` | Text |
| `location.name` | Text |
| `location.id` | Record ID |
| `tag` | Text |
| `created` | Date |
| `updated` | Date |

### Locations

| Field | Type |
|---|---|
| `code` | Full text |
| `name` | Full text |
| `description` | Full text |
| `id` | Record ID |
| `archived` | Yes or no |
| `taxon` | Full text |
| `taxon.id` | Record ID |
| `material.type` | Fixed list |
| `material.status` | Fixed list |
| `created` | Date |
| `updated` | Date |

The list shows active locations unless the query names `archived`.
`archived:true` lists the archived locations, and `archived:false` lists the
active ones.

The `taxon` field on this list asks what a location holds, so `taxon:Quercus`
finds the locations that hold an oak.

### Taxa

| Field | Type |
|---|---|
| `name` | Full text |
| `author` | Text |
| `rank` | Fixed list |
| `id` | Record ID |
| `parent` | Full text |
| `parent.id` | Record ID |
| `parentage` | Full text |
| `material.type` | Fixed list |
| `material.status` | Fixed list |
| `location.code` | Text |
| `location.name` | Text |
| `location.id` | Record ID |
| `accessions` | Count |
| `tag` | Text |
| `synonym` | Text |

The `name` field matches common names as well as scientific names.

The `parent` field matches the taxon's parent in the hierarchy, so
`parent:Quercus` finds the species of oak. The `parentage` field matches the taxa a hybrid was crossed
from, so `parentage:Cattleya` finds the crosses that have a *Cattleya* parent.

The `accessions` field counts the accessions of a taxon. `accessions:>0` finds
the taxa you hold, and `accessions:0` finds the ones you do not. The **Only taxa
with accessions** checkbox above the table writes `accessions:>0` for you.

The `synonym` field is the exception to the type table. Sepal looks the value
up in the synonyms it knows and returns the taxa those names point to.

### Contacts

| Field | Type |
|---|---|
| `name` | Full text |
| `email` | Full text |
| `business` | Full text |
| `address1` | Text |
| `address2` | Text |
| `city` | Text |
| `address` | Text |
| `id` | Record ID |
| `created` | Date |
| `updated` | Date |

The `address` field matches the single-line address that a contact carries
from before the address was split into separate fields.

### Propagation

| Field | Type |
|---|---|
| `id` | Record ID |
| `status` | Fixed list |
| `type` | Fixed list |
| `location` | Full text |
| `location.id` | Record ID |
| `accession` | Full text |
| `accession.id` | Record ID |
| `taxon` | Full text |
| `taxon.id` | Record ID |
| `rootstock` | Full text |
| `propagated` | Date |
| `succeeded` | Date |
| `created` | Date |
| `updated` | Date |

The `accession` and `taxon` fields match the parent the propagation was taken
from. The `location` field matches the location's name.

The list opens with `status:active`, so it shows the propagations still in
progress. A query that names a status replaces that default, and `status:*`
removes it and lists every propagation.

### Observations

| Field | Type |
|---|---|
| `code` | Text |
| `location` | Text |
| `type` | Text |
| `value` | Text |
| `observed` | Date |
| `observer` | Text |
| `due` | Date |
| `overdue` | Date |
| `subject` | Fixed list |
| `id` | Record ID |

The `subject` field takes `material` or `location`, the two kinds of record an
observation can be made on.

The `due` field compares the next check date. The `overdue` field takes a date
and finds the observations whose next check falls on or before it, leaving out
any that a later observation of the same type on the same record has followed
up. The **Only overdue observations** checkbox above the table writes
`overdue:` with today's date for you.

{{< note >}}
The search grammar in the app is the source of truth for both the language and
the fields. If a query that this page shows does not work, report it.
{{< /note >}}
