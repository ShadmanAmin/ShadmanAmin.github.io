# Md Shadman Amin — personal site

Jekyll site built on the [Jasper](https://github.com/jekyllt/jasper) theme (a
port of Ghost's Casper). No plugins, so it deploys to GitHub Pages or GitLab
Pages as-is.

## Running it

```sh
pixi run dev     # http://localhost:4000
pixi run build   # build to _site/
pixi run media   # regenerate web-sized images/video from _media_src/
```

## Adding content

| I want to add…       | Create a file in | Example                      |
|----------------------|------------------|------------------------------|
| A blog post          | `_posts/`        | `2026-08-01-my-post.md`      |
| A research entry     | `_research/`     | `new-study.md`               |
| A project            | `_projects/`     | `new-sensor.md`              |
| Something unserious  | `_fun/`          | `home-lab.md`                |

Copy an existing entry — `_projects/lora-starlink-observatory.md` uses every
field the layouts understand. Useful ones:

- `cover:` — full-bleed header image (use something from `assets/img/covers/`)
- `thumb:` — card image (`assets/img/cards/`); falls back to `cover`
- `featured: true` — also show it on the homepage
- `subtitle`, `year`, `status`, `role`, `stack`, `links`

## Adding images or video

1. Put the original in `_media_src/` (any size — mine were up to 23 MB).
2. If it should be usable as a page header, add its basename to `COVER_LIST`
   near the top of `tools/process-media.sh`.
3. Run `pixi run media`.
4. Reference the **output**, e.g. `/assets/img/cards/my-photo.jpg`.

Originals in `_media_src/` are never published — only the resized derivatives.

## Before publishing

- [ ] Read through the copy — I drafted it from your bio, so it should sound
      like you, not like a summary of you. The Fun! page especially.
- [ ] Set `url` / `baseurl` in `_config.yml` for wherever you host it
- [ ] Decide whether your phone number belongs on `/contact/` (it is currently
      omitted deliberately)
- [ ] Swap `assets/img/favicon.svg` for something of your own
- [ ] Delete `jasper-master/` once you no longer need it as reference

`CLAUDE.md` documents the architecture in more depth.
