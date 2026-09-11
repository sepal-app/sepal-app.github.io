---
title: Search your collection
description: Work one list page from a single word down to the few rows you wanted.
group: Finding things
weight: 190
steps: true
---

Five lists in Sepal carry the same search box: **Accessions**, **Material**,
**Locations**, **Taxa**, and **Contacts**. The box searches text and filters
fields at the same time. This page works one query from a bare word down
to a narrow result. [Query syntax](/docs/query-syntax/) describes the whole
grammar, including comparisons, negation, and matching several values at once.

## Open a list page

Select **Accessions**, **Material**, **Locations**, **Taxa**, or **Contacts** in
the sidebar. The search box sits at the left of the bar above the table, and its
placeholder shows an example query for that page. On **Accessions** it reads
`Search... (e.g., taxon:Quercus provenance:wild)`.

At the right of the same bar, a count reads `25 of 1,284`. The first number is
the rows loaded so far and the second is the rows the query matched. Watch the
second number as you type, because it is how you know whether a term did any
work.

## Search for a word

Type a word and stop. Sepal runs the search as you type, so there is no button
to select, and the table and the count both update.

A bare word is a full-text search, and what it matches depends on the page:

| List | A bare word matches |
|---|---|
| Accessions | The accession code |
| Material | The taxon name |
| Locations | The name, the code, and the description |
| Taxa | The taxon name |
| Contacts | The name, the business, and the email address |

The last word you type is matched as a prefix, so `Quer` finds `Quercus` before
you finish typing it. Every word before it has to match in full. Quotation marks
make no difference to a bare search: Sepal looks for each word on its own, so
`"red oak"` matches the same records as `red oak` does.

## Filter on a field

A bare word on the **Accessions** list reaches the code and nothing else, so
searching for a name needs a field. Add `field:value` to what you have already
typed.

```
taxon:Quercus
```

The fields differ by list. [Which fields
exist](/docs/query-syntax/#which-fields-exist) gives every field that each list
takes, with the type that decides how it matches.

Sepal ignores a field it does not recognize rather than reporting it, so a
misspelled field name widens the result instead of narrowing it. If a term
appears to do nothing, check its spelling against that table.

## Narrow the result

Add a second term. Sepal joins terms with AND, so a record has to match all of
them, and each term you add can only make the result smaller.

```
taxon:Quercus location:GH material.status:alive
```

That query matches oaks with living [material](/docs/glossary/#material) in
`GH`. The glossary lists every value that [material
status](/docs/glossary/#material-status) and
[material type](/docs/glossary/#material-type) take. Keep adding terms until the
count is small enough to read, then select a row to open its panel beside the
table.

To widen one field without widening the rest, separate its values with commas.
Commas mean OR inside a single field, and two different fields still narrow each
other. A comma list also matches each value exactly, where a single value
matches a substring, so `location:GH,SH` misses the `GH2` that `location:GH`
finds. [How a text filter
matches](/docs/query-syntax/#how-a-text-filter-matches) explains that.

```
taxon:Quercus location:GH,SH
```

## Build a filter from the dropdown

When you cannot remember a field name or the values it takes, build the term
instead of typing it.

1. Select **Filter** beside the search box. The **Add Filter** panel opens.
2. Choose a field from **Select field...**. The list holds the fields for the
   page you are on, by their labels rather than their query names.
3. Choose an operator. A text field offers `Contains`, `Does not contain`,
   `Equals`, and `Does not equal`. A date field offers `Equals`, `After`, `On or
   after`, `Before`, and `On or before`.
4. Enter a value. A field with a fixed set of values offers them in a **Select
   value...** list rather than a text box.
5. Select **Add**.

Sepal appends the term to whatever is already in the search box and reruns the
search. The box keeps the text, so you can read what the dropdown wrote and edit
it by hand from there.

## Widen a search that matched nothing

An empty table under a query you typed reads `Nothing matched`, with the advice
to try fewer terms or clear the filters. That is a query problem rather than an
empty collection, and Sepal says so rather than offering to create a record.

Delete the last term you added and watch the count. A term that changes nothing
was either redundant or misspelled, and a term that drops the count to zero is
the one to reconsider.

## What to read next

- [Query syntax](/docs/query-syntax/) describes the whole grammar, including
  comparisons, negation, and nested fields.
- [Add and edit accessions](/docs/accessions/) describes the fields the
  accession filters read.
- [Track material and locations](/docs/material-and-locations/) describes the
  values that `type` and `status` take.
