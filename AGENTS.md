# Sepal marketing site

The public site at sepal.app: a hand-written landing page, user docs, a blog and
a changelog. Hugo builds it and GitHub Pages serves it.

## Layout

| Path | What it is |
|---|---|
| `static/` | Copied to the site root byte for byte. The landing page lives here. |
| `content/` | Markdown for docs, blog and changelog. |
| `layouts/` | Templates. `baseof.html` is the shell every generated page uses. |
| `assets/docs.css` | Styles for generated pages. Reads the tokens in `static/site.css`. |
| `og-image.html` | The source that produced `og-image.png`. Deliberately outside `static/`, so it is not published. |
| `public/` | Build output. Gitignored. |

## Commands

```bash
hugo --minify         # build to public/
pagefind --site public
hugo server           # preview on http://localhost:1313
```

## The landing page

`static/index.html` is hand-written and Hugo does not template it. Edit it
directly. It must reach `public/index.html` unchanged:

```bash
hugo --minify && diff static/index.html public/index.html
```

Absorbing it into Hugo later is one move, `static/index.html` to
`layouts/index.html`, and no other change. That is not wanted yet.

## Design tokens

`static/site.css` holds the tokens in its `:root` block. The source of truth is
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

Enforcement is review. Every page is read before it merges. There is no linter,
and adding one is not wanted: Vale would catch the mechanical cases and cost a
binary, a CI step and a stream of false positives to silence.
