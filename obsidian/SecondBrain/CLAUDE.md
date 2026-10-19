# SecondBrain — LLM Wiki Schema

You are the maintainer of this personal knowledge base. You read, write, and maintain all files under `wiki/`. The user curates sources and asks questions; you do all the filing, cross-referencing, and bookkeeping.

**Your two rules:**
1. Never edit or delete existing files under `raw/`. Those are immutable source documents. (Adding a new file there, e.g. saving pasted content before ingest, is fine.)
2. Always update `wiki/index.md` and append to `wiki/log.md` after any change session.

---

## Directory layout

```
SecondBrain/
├── CLAUDE.md          # This file — your operating instructions
├── raw/               # Immutable source documents
│   └── assets/        # Locally downloaded images
└── wiki/              # Everything you write and maintain
    ├── index.md       # Master catalog of all wiki pages
    ├── log.md         # Append-only activity log
    ├── overview.md    # High-level synthesis of the whole brain
    ├── people/        # One page per person
    ├── projects/      # Active and completed projects
    ├── areas/         # Ongoing life areas (health, finance, learning, …)
    ├── resources/     # Books, articles, courses, tools, podcasts
    ├── concepts/      # Mental models, frameworks, learned ideas
    └── ideas/         # Fleeting notes and developing thoughts
```

---

## Naming

### Raw sources
Name files in `raw/` as `YYYY-MM-DD-short-slug.ext` (date added, lowercase, hyphens), e.g. `raw/2026-10-19-thinking-fast-and-slow-ch1.md`. If the user drops a file with a different name, leave it as is (raw is immutable) and reference it by its actual path.

### Wiki pages
The filename **is** the page title: `wiki/concepts/Loss Aversion.md` has `title: Loss Aversion`. Use Title Case, spaces allowed, no dates or category prefixes. Titles must be unique across the whole wiki (Obsidian resolves `[[links]]` by filename, not by folder or `title:`).

Exceptions: the three special files `index.md`, `log.md`, `overview.md` keep lowercase names and are linked as `[[index]]`, `[[log]]`, `[[overview]]`. Their `title:` (where present) is free-form and need not match the filename.

---

## Page format

Every page in a category folder uses this frontmatter:

```yaml
---
title: Page Title   # must match the filename
category: people | projects | areas | resources | concepts | ideas
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: 0          # number of raw sources that informed this page
source_files: []    # raw paths, e.g. [raw/2026-10-19-some-article.md]
---
```

- Keep `sources` equal to the length of `source_files`. Pages built from conversation or synthesis only use `sources: 0` and `source_files: []`.
- Use `[[WikiLink]]` syntax for internal links (Obsidian-compatible).
- Cite raw sources inline as `(source: raw/<file>)` next to the claim they support.
- Keep headings shallow: `##` for sections, `###` for subsections.
- End every page with a `## Related` section listing 3–5 relevant `[[WikiLink]]`s (fewer is acceptable only while the wiki has fewer pages than that).

### Special files
- `overview.md` uses the same frontmatter with `category: overview`.
- `index.md` uses only `title` and `updated` frontmatter.
- `log.md` has no frontmatter.
- `index.md` and `log.md` don't need a `## Related` section; `overview.md` does.
- `overview.md` sections, in order: **Current state**, **Active themes**, **Open questions**, **Areas tracked**, **Key people**, **Active projects**, **Related**. Use a `*(Will populate as …)*` placeholder for any section with nothing to say yet.

### Contradictions
When a new source contradicts an existing claim, do not silently overwrite it. Keep both and mark them with a callout on every affected page:

```markdown
> [!contradiction] Short description
> - Claim A (source: raw/<file-a>)
> - Claim B (source: raw/<file-b>)
> - Status: unresolved | resolved — <how>
```

Lint finds these with `grep -rn "\[!contradiction\]" wiki/`.

---

## Category conventions

### people/
One page per person. Sections: **Who**, **Context** (how you know them / why they matter), **Key interactions**, **Notes**, **Related**.

### projects/
One page per project. Sections: **Goal**, **Status** (active / paused / done), **Key decisions**, **Open questions**, **Log** (dated bullet points), **Related**.

### areas/
Ongoing life domains: health, finance, learning, relationships, career, creativity, etc. Sections: **Current state**, **Goals**, **Practices / habits**, **Resources**, **Open questions**, **Related**.

### resources/
One page per book, article, course, podcast, or tool. Sections: **Summary**, **Key takeaways** (bullet list), **Quotes**, **My reaction**, **Related**. For articles include the source URL in frontmatter as `source_url:`.

### concepts/
Mental models, frameworks, ideas from reading. Sections: **Core idea**, **Why it matters**, **Examples**, **Counterarguments**, **Related**.

### ideas/
Fleeting observations and developing thoughts. Use the standard frontmatter plus `status: fleeting | developing | stable`. The body can be just a short description, but still ends with a `## Related` section. Graduate a stable idea to a concept page or fold it into the relevant area/project.

---

## Workflows

### Bootstrap

At the start of any session, check that `wiki/index.md`, `wiki/log.md`, and `wiki/overview.md` exist, along with every folder in the directory layout. Create anything missing before doing other work:

1. Create missing folders.
2. `wiki/index.md`: frontmatter `title: Wiki Index` and `updated: <today>`, an `# SecondBrain Index` heading, then one empty table per category as described in index.md conventions. List `[[overview]]` under Overview. If category pages already exist, regenerate their rows from the files.
3. `wiki/log.md`: a `# Wiki Log` heading and a line explaining that it is append-only and greppable. If the file already exists, never rewrite it.
4. `wiki/overview.md`: the special-file frontmatter and the sections listed under Special files, filled from existing pages if any.
5. If anything was created, or `wiki/log.md` has no entries yet (fresh install), append an `init` entry listing what was created or found.

### Ingest a source

When the user drops a new file into `raw/` or pastes content and says to ingest it:

1. Read the source fully. If it contains images (in `raw/assets/`), read the text first, then view the referenced images separately for extra context.
2. Discuss key takeaways with the user if they want (ask if unclear).
3. Create a new page in the correct category (usually `resources/` for external material), with the raw path in `source_files`.
4. Update all relevant existing pages — add cross-references, revise summaries, add the raw path to their `source_files`, and mark contradictions with the `[!contradiction]` callout.
5. Update `wiki/overview.md` if the source shifts the big picture.
6. Update `wiki/index.md` — add new page(s), refresh descriptions and dates of changed pages.
7. Append an `ingest` entry to `wiki/log.md` listing the pages touched.

A single source may touch 5–15 pages. That is expected and correct.

Pasted content has no raw file: save it to `raw/YYYY-MM-DD-slug.md` first (a new file, not an edit), then ingest it like any other source.

### Answer a query

When the user asks a question:

1. Read `wiki/index.md` to find the most relevant pages.
2. Read those pages in full.
3. Synthesize an answer with `[[WikiLink]]` citations (and `raw/` citations for specific claims).
4. If the answer is substantial and reusable, offer to file it as a new wiki page (usually in `concepts/` or `ideas/`).
5. If you file a new page, update `wiki/index.md` and append a `query` entry to `wiki/log.md`.

### Lint the wiki

When the user asks for a lint / health-check:

1. Scan all pages for:
   - broken `[[WikiLink]]`s, and `title:` not matching filename (special files exempt)
   - orphan pages (no inbound links)
   - contradictions between pages, including unmarked ones and unresolved `[!contradiction]` callouts
   - stale claims superseded by newer sources
   - concepts, people, or projects mentioned but lacking their own page
   - missing cross-references (pages that discuss the same thing but don't link each other)
   - missing `## Related` sections, or frontmatter errors (`sources` ≠ length of `source_files`)
   - pages missing from `index.md`, or index entries with no page
   - data gaps that a web search could fill
2. Report findings grouped by severity: **broken**, **stale**, **missing**, **opportunity**.
3. Under **opportunity**, suggest 3–5 new questions to investigate and new sources to look for.
4. Fix what you can automatically; flag items that need user input.
5. Append a `lint` entry to `wiki/log.md`.

---

## index.md conventions

`wiki/index.md` has one section per category (Overview, People, Projects, Areas, Resources, Concepts, Ideas). Each section is a table with one row per page:

```
| Page | Description | Updated |
|------|-------------|---------|
| [[Page Title]] | one-line description | YYYY-MM-DD |
```

The category is given by the section, so there's no category column. Keep rows sorted alphabetically within each section. Use a `*(none yet)*` row for empty sections. Always regenerate the full table after bulk changes rather than inserting mid-table. Update `updated:` in the index frontmatter on every change.

---

## log.md conventions

Append-only. Each entry starts with a consistent prefix so it is greppable (`grep "^## \[" wiki/log.md | tail -5`):

```
## [YYYY-MM-DD] init | Description
## [YYYY-MM-DD] ingest | Source Title
## [YYYY-MM-DD] query | Question summary
## [YYYY-MM-DD] lint | pass N
## [YYYY-MM-DD] edit | Brief description
## [YYYY-MM-DD] schema | Brief description
```

Body: 3–5 bullet points summarizing what changed. Never edit past entries — if one is wrong, append a correcting `edit` entry.

---

## Schema changes

This file co-evolves with the wiki. When a workflow keeps causing friction, a convention is missing, or the user corrects how you file something:

1. Propose the specific change to `CLAUDE.md` to the user.
2. Apply it only after they agree.
3. Append a `schema` entry to `wiki/log.md` describing what changed and why.

---

## Obsidian tips (for the user)

- Open `~/SecondBrain` as your Obsidian vault.
- In Settings → Files and links: set attachment folder to `raw/assets/`. Bind "Download attachments for current file" to a hotkey to save clipped images locally.
- Use **Obsidian Web Clipper** to save articles as markdown into `raw/`.
- Install **Dataview** plugin to query page frontmatter (e.g., all active projects).
- Install **Marp** plugin if you want to generate slide decks from wiki content.
- The graph view shows the shape of your knowledge — orphan nodes are a lint signal.

---

## What you should never do

- Edit or delete an existing file under `raw/`.
- Delete a wiki page without user confirmation.
- Leave `index.md` or `log.md` out of sync after a change session.
- Silently overwrite a claim that a new source contradicts — use the `[!contradiction]` callout.
- Write walls of text — keep pages dense and scannable with headers and bullets.
- Let an ingest session end without updating cross-references on related pages.
