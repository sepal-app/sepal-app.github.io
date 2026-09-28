# Sepal marketing site

The public site at sepal.app: a hand-written landing page, user docs, a blog and
a changelog. Hugo builds it and GitHub Pages serves it.

## Layout

| Path | What it is |
|---|---|
| `static/` | Copied to the site root byte for byte. |
| `content/` | Markdown for docs, blog and changelog. |
| `layouts/` | Templates. `index.html` is the landing page; `baseof.html` is the shell every other page uses. |
| `i18n/` | Strings for the landing page, Login and the shared header and footer. `en.yaml` is edited by hand; `es.yaml` is written by `bin/translate`. |
| `assets/site.css` | Styles and design tokens for every page. Published fingerprinted, so a change gets a new URL. |
| `assets/docs.css` | Styles for generated pages. Reads the tokens in `assets/site.css`. |
| `assets/icons/lucide/` | Lucide icons the templates inline, with Lucide's license. |
| `og-image.html` | The source that produced `og-image.png`. Deliberately outside `static/`, so it is not published. |
| `public/` | Build output. Gitignored. |

## Commands

```bash
hugo --minify         # build to public/
pagefind --site public
hugo server           # preview on http://localhost:1313
bin/translate es      # translate new and changed strings into i18n/es.yaml
```

## The landing page

`layouts/index.html` is a standalone template: it does not use `baseof.html`,
and it loads neither `docs.css` nor search. It shares the header and footer
with every other page through `partials/header.html` and `partials/footer.html`.

Its text lives in `i18n/en.yaml`, not in the template. To change a sentence,
edit the string there; to add one, add a key and an `{{ i18n "key" }}` call.
Strings holding HTML render through `safeHTML`. Asset paths are root-relative
(`/fonts/...`), since the page is also rendered below the site root.

## Translations

English is served at the site root and Spanish below `/es/`. The landing page
and Login exist in Spanish; a content page does when it has a `.es.md` file, as
`content/login.es.md` does. Docs, blog and changelog are English only. A page
with a translation gets a language menu in the header and `hreflang` links.

`bin/translate es` sends new and changed strings from `en.yaml` to Claude, with
the app's glossary and the two prose sections below, and writes `es.yaml`. It
reads the glossary from `../app/components/i18n/glossary.md`, so the app repo
must be checked out beside this one. Review the diff before committing.

Each Spanish entry records a hash of the English it was translated from, and
the script retranslates an entry when that English changes. Editing only a
`description` does not count. To retranslate an entry for another reason,
delete it from `es.yaml` and run the script again. A hand edit to `es.yaml`
stays until the English changes.

The CI build fails when `es.yaml` lacks a key `en.yaml` has, or when the file is
missing, since Hugo would otherwise render English without a warning. It does
not check hashes, so run `bin/translate es` after editing `en.yaml`.

A content page whose front matter names `titleKey` and `descriptionKey` takes
its title and meta description from `i18n/`, so the Spanish file needs no text
of its own. The banner that offers Spanish on English pages reads `es.yaml`
directly, because `i18n` only returns strings in the language being rendered.

## Design tokens

`assets/site.css` holds the tokens in its `:root` block. The source of truth is
`bases/app/src/sepal/app/css/tokens.css` in the `sepal-app/sepal` repo, where
the values are checked against WCAG AA by a test. Sync is by hand. When you
change a colour here, change it there first.

Do not add a CSS build step. There is no Node in this repo and no reason for one.

## Prose

The baseline is the [Google developer documentation style
guide](https://developers.google.com/style). It settles capitalization, voice,
tense, lists and code formatting. Read it before writing a page.

On top of it, these do not appear:

- Em-dash overuse. One per paragraph at most.
- Three-part constructions. "Fast, simple, and reliable."
- "Seamlessly", "robust", "powerful", "simply", "just", "leverage", "utilize".
- "It's not just X, it's Y."
- A rhetorical question opening a section.
- Bold used for emphasis inside a sentence. Bold is for UI labels and defined
  terms.
- A summarizing flourish at the end of a section.
- Emoji.
- Sentence fragments. Every sentence carries a subject and a verb.
- An aphorism or an epigram. A sentence that sounds quotable is wrong here.
- A definition written as a phrase instead of a sentence. "A material is the
  living stuff of an accession, in one place, counted." The first sentence about
  a thing says what it is: "A material is a quantity of an accession at one
  location."

A docs page title names a task, written as a verb phrase. A concept does not get
a page of its own: it belongs in the glossary, and the task page links to it at
the point the reader needs it.

External references live in one place, the glossary's Further reading section.
Open every external link and confirm it resolves before it ships.

Register differs by section. Docs are second person, present tense, imperative
for steps: "Open Settings. Select Users." Blog posts may be first person.

Every factual claim in the docs is traceable to the app. Name the file you took
it from in the pull request, not in the page.

A field in the spec is not a feature. Before documenting one, find the control
that renders it: `private` and `memorial` are both in the schema, neither has a
form field, and both reached a page before anyone checked.

Enforcement is review. Every page is read before it merges. There is no linter,
and adding one is not wanted: Vale would catch the mechanical cases and cost a
binary, a CI step and a stream of false positives to silence.

## Spanish prose

`bin/translate` sends this section and the one above to the model with every
request, so a rule added here changes the next translation.

- Write neutral Latin American Spanish: "computadora", "costo", "ingrese".
  Avoid words local to one country. The language is still published as `es`.
- Address the reader as *usted*. Buttons and navigation links take the
  infinitive: "Crear una cuenta", "Iniciar sesión". A link inside a sentence
  follows the grammar of the sentence.
- Use the term in the Español column of `app/components/i18n/glossary.md` for
  each domain word. Where the column is empty, use the word Spanish-speaking
  botanical gardens use, not a calque of the English.
- Self-hosting is "instalación propia", and where it runs is "su propio
  equipo" or "su propio servidor".
- Prefer a Spanish word to an anglicism where gardens in Spanish-speaking
  countries use one.
- The rules in Prose above apply where they are not specific to English:
  plain sentences, no flourishes, no emphasis for effect.
- "Sepal", prices, sizes such as "2 GB", and `sepal.app` addresses stay as
  they are. Plan names are translated: Personal, Jardín, Institución.
