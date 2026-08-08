# mikerockwood.com

Personal site, portfolio, blog, and assorted internet debris.

The site is built with [Zola](https://www.getzola.org/), styled with [UIkit](https://getuikit.com/), and published as a static site.

![Screenshot of mikerockwood.com](screenshot.png)

## Requirements

- [Zola](https://www.getzola.org/), using the version in [`ZOLA_VERSION`](ZOLA_VERSION)
- GNU Make

Zola can be installed with your operating system's package manager or from the [official releases](https://github.com/getzola/zola/releases). The Makefile checks the version before running. If Zola is installed somewhere unusual, point Make at it:

```sh
make ZOLA=/path/to/zola serve
```

## Local development

```sh
# Start a draft-enabled server and open it in a browser
make serve

# Build the production site
make build

# Check templates and content
make check

# Check the local Zola installation
make doctor
```

The generated site goes into `public/`.

## Project layout

```text
content/     Pages, posts, documentation, and work history
sass/        UIkit Sass and site-specific styles
static/      Fonts, images, JavaScript, CMS files, and other static assets
templates/   Zola templates, components, and shortcodes
config.toml  Site and author configuration
Makefile     Local development commands
```

## Content

The main sections are:

- `content/pages/` for evergreen pages like About, Uses, and Colophon
- `content/posts/` for the publishing stream
- `content/work/` for portfolio projects

Posts are organized by type, including articles, bookmarks, jams, likes, notes, photos, replies, reposts, RSVPs, and videos. Every type has a standalone page, appears in the unified post stream, and can be included in an Atom feed. Most content is written in Markdown with YAML front matter.

### Front matter naming

Zola's built-in fields keep Zola's spelling, such as `sort_by` and `page_template`. Site-specific fields use kebab-case, such as `featured-image`, `external-link`, and `bookmark-of`. Simple one-word fields stay lowercase, such as `service`, `thumbnail`, and `id`.

### Post fields

Every post has a `date` and a `taxonomies.categories` value matching its post type. Titled posts also have a `title`, and most posts have Markdown content below the front matter. `tags` are optional.

The post type comes from its directory and category taxonomy, not a duplicated front matter field. Summaries are optional and can be created with Zola's `<!-- more -->` marker. Canonical URLs are generated from the page permalink, and the author comes from `config.toml`.

### IndieWeb markup

Post pages and stream entries use Microformats2. Each `h-entry` exposes its canonical URL, author, publication date, content, and categories where applicable. Interaction posts also expose their relationship target with properties such as `u-like-of`, `u-bookmark-of`, `u-repost-of`, and `u-in-reply-to`. Photos, audio, video, and RSVPs expose their type-specific properties too.

The site supports h-card identity, h-entry posts, Atom feeds, Webmention receiving through webmention.io, and Webmention sending after successful deployments. IndieAuth is intentionally not enabled.

Every post uses `h-entry`, `u-url`, `u-uid`, `p-author`, `dt-published`, and `e-content` where content exists. Articles, bookmarks, jams, notes, likes, photos, replies, reposts, RSVPs, and videos add their relevant properties: relationship URLs use `u-bookmark-of`, `u-like-of`, `u-repost-of`, or `u-in-reply-to`; photos use `u-photo`; media uses `u-audio` or `u-video`; and RSVPs use `p-rsvp` plus `u-in-reply-to`. The canonical author h-card is rooted at the site URL in `config.toml`.

## Publishing

The site is deployed to GitHub Pages through GitHub Actions. The CMS lives at `/admin/` and uses [Sveltia CMS](https://github.com/sveltia/sveltia-cms).

The site also includes IndieWeb features such as microformats, Atom feeds, and Webmention support. Social profile links and author details live in `config.toml`.

## Useful files

- `config.toml` controls site metadata, menus, taxonomies, and author information
- `templates/base.html` defines the shared page shell
- `templates/posts/single.html` is the shared single-post shell
- `templates/posts/` contains post-type layouts and type-specific components
- `templates/components/` contains reusable Tera components
- `templates/partials/` contains reusable template fragments
- `scripts/check-site.sh` checks important generated metadata and microformats
- `templates/shortcodes/` contains Markdown shortcodes
- `sass/style.scss` is the main stylesheet entry point
- `.github/workflows/` contains build, deployment, and Webmention automation

UIkit 3.25.13 and the Rubik fonts are vendored in `static/` so the site can build without Node or a dependency install. The `uikit*.js` files are upstream UIkit assets. `theme-picker.js` is site-specific. The Sass source lives in `sass/`, while Zola writes generated image derivatives and the finished site to `public/`. Original media stays in `static/images/`.

Generated HTML is checked against a 64 KiB budget. Large source images are intentionally kept separate from generated derivatives so individual templates can choose an appropriately resized output.

## License

Unless noted otherwise, the content and design belong to Mike Rockwood. Third-party images, fonts, libraries, and other assets retain their original licenses.
