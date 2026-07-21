# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

Ruby, bundler and the Jekyll gems were installed *inside* the pixi environment,
and pixi also supplies ImageMagick and ffmpeg. Every command must go through
pixi (or run from an activated `pixi shell`) — `magick` and `ffmpeg` are not on
the system PATH:

```sh
pixi run dev      # bundle exec jekyll serve — localhost:4000
pixi run build    # bundle exec jekyll build — output to _site/
pixi run media    # regenerate images/video from _media_src/ (see below)
```

No test suite, no linter. A clean `jekyll build` is the check. When touching
layouts or asset paths, verify nothing broke by confirming every local
reference in the built site still resolves — a Ruby one-liner over
`_site/**/*.{html,css,xml}` collecting `src=`, `href=` and `url(...)` catches
missing images and bad permalinks, which are the failure modes here.

## Theme

The site is built on **Jasper**, a Jekyll port of Ghost's Casper theme. This is
important: `assets/css/screen.css`, `assets/css/syntax.css`,
`assets/fonts/casper-icons.*`, `assets/js/index.js` and
`assets/js/jquery.fitvids.js` are **vendored verbatim** from
`jasper-master/jasper-master/`. Do not hand-edit them — site-specific styling
belongs in `assets/css/custom.css`, which loads last.

An earlier attempt reimplemented a theme's look from scratch and lost most of
it. The lesson stuck: use the vendored stylesheet and write markup that matches
the class names it already styles.

Casper class vocabulary the layouts depend on:

- `.main-header` — full-bleed cover header; add `.post-head` for the shorter
  65vh variant, `.no-cover` for the flat one. Cover set via inline
  `style="background-image: url(...)"`.
- `.main-nav.overlay` + `.menu-button` — opens the slide-out `.nav` panel;
  `assets/js/index.js` toggles `nav-opened`/`nav-closed` on `<body>`.
- `.post` — the 710px text column. **Anything not inside `.post` is
  unconstrained**, which is why `custom.css` adds a `.content > .post-content`
  rule.
- `.post-content`, `.post-meta`, `.post-footer`, `.author-image`, `.read-next`,
  `.icon-*` (from the casper-icons webfont).

`<body>` needs the right template class — `home-template`, `page-template` or
`post-template` — because Casper scopes several rules to it. Layouts set it via
`page.class`.

Casper sets `html { font-size: 62.5% }`, so **1rem = 10px** in both stylesheets.

## Architecture

Stock Jekyll 4, no plugins — so it deploys to GitHub Pages or GitLab Pages
without a plugin allowlist. Jasper's own `_plugins/` (author and tag
generators) and its `jekyll-paginate` dependency were deliberately **not**
carried over. `_includes/head.html` and `feed.xml` cover SEO and syndication by
hand; do not add `jekyll-feed`/`jekyll-seo-tag`/`jekyll-sitemap`.

### Content model

| Source        | URL                       | Layout  | Index page      |
|---------------|---------------------------|---------|-----------------|
| `_research/`  | `/research/:name/`        | `entry` | `research.html` |
| `_projects/`  | `/projects/:name/`        | `entry` | `projects.html` |
| `_fun/`       | `/fun/:name/`             | `entry` | `fun.html`      |
| `_posts/`     | `/blog/:y/:m/:d/:title/`  | `post`  | `blog.html`     |

All three collections share the `entry` layout; `defaults` in `_config.yml`
assigns it plus a `kind` label. **A new collection needs a `defaults` entry
too**, or its documents fall back to `page`.

Front matter the layouts read: `cover` (header image), `thumb` (card image,
falls back to `cover`), `subtitle`, `year`, `status`, `role`, `stack` (list),
`links` (list of `{label, url}`), `featured: true` (promotes onto the
homepage).

Key includes:

- `site-header.html` — the cover header, parameterised (`cover`, `title`,
  `subtitle`, `big`, `scroll`). Every page header goes through it.
- `card-grid.html` — responsive card grid for collection indexes.
- `read-next.html` — Casper's two-up footer panel. Uses `page.previous`/
  `page.next`, which Jekyll exposes on collection documents as well as posts.
- `author-card.html`, `navigation.html` (built from `site.nav` in `_config.yml`).

### Media pipeline

Originals are large — the source set was ~220 MB, with single images over
13 MB and video over 23 MB. They live in **`_media_src/`, which is excluded
from the build and never served**. `tools/process-media.sh` (via `pixi run
media`) generates the only files the site references:

- `assets/img/covers/` — 1900px wide, q78, for full-bleed headers
- `assets/img/cards/` — 1100px wide, q80, for cards and in-body figures
- `assets/video/` — 720p h264 with `+faststart`, plus a poster frame per clip
- logos stay lossless PNG/SVG in `assets/img/` (the script skips `*logo*` in
  the JPEG path, or transparency is lost)

That takes the served payload to ~28 MB. **Reference only the derivatives**;
pointing a page at `_media_src/` will 404 in the built site. To add media, drop
the original in `_media_src/`, add its basename to `COVER_LIST` in the script if
it should also get a cover-sized version, and rerun `pixi run media`.

## Deployment

`url`/`baseurl` in `_config.yml` are set for a GitHub user site
(`ShadmanAmin.github.io`, empty `baseurl`). For a project repo or GitLab group
path, set `baseurl` to the subpath — every internal link already goes through
`relative_url`/`absolute_url`.

## Reference copy

`jasper-master/` is the upstream theme, kept for reference and excluded from the
build. It is the source of truth for the vendored CSS/JS — re-copy from it
rather than reconstructing anything by hand.
