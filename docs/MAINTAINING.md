# Maintaining mikerockwood.com

This document records the parts of the site that are easy to forget between
updates. It is intentionally operational rather than a description of every
template.

## Local development and dependencies

Local editing and builds are intended to require only:

- Zola `0.23.2`, as recorded in [`ZOLA_VERSION`](../ZOLA_VERSION)
- GNU Make

Use the Makefile so the installed Zola version is checked consistently:

```sh
make doctor  # verify Zola and its version
make serve   # serve drafts locally and open a browser
make check   # check templates and links
make build   # generate public/
```

The `public/` directory and Zola's `static/processed_images/` derivatives are
generated output and are ignored by Git. There is no local Node or Python setup
requirement. CI may use isolated tools for validation and Webmention sending.

## Rendering architecture

Content lives under `content/`. Each section's `_index.md` selects a section
template, and individual pages may select a page template. Templates inherit
from `templates/base.html`, which owns the document shell, shared metadata,
header, footer, global menus, scripts, and the intentional registry of content
sections. Components, partials, and shortcodes provide reusable pieces below
that layer.

The main paths are:

```text
content section/page
  → section or page template
  → templates/base.html
  → generated files in public/
```

The centralized section registry in `base.html` includes future post types even
when their sections are currently empty. Add a new section there when adding a
new post type; remove it only when that type is permanently retired.

## Content and Sveltia CMS

Content is organized into evergreen pages, work projects, and post-type
sections. The post type comes from the directory, while the category taxonomy
identifies that type in the publishing stream. Type-specific fields use the
site's existing kebab-case names such as `bookmark-of`, `like-of`, and
`featured-image`.

Sveltia is served from `static/admin/` and loaded from its hosted JavaScript
package. Its configuration is in `static/admin/config.yml`; it writes to the
`main` branch of the repository. Keep the CMS fields aligned with the matching
content front matter and templates. A field is not useful merely because the
CMS can edit it: it must have a known rendering path.

After a CMS edit reaches `main`, the GitHub Pages workflow checks and builds the
site before deployment. Local preview remains `make serve`.

## CI/CD workflows

- `gh-pages.yml` builds on pushes to `main`, pull requests, and the daily
  schedule. The pinned Zola Pages action runs `zola check` with external links
  skipped, builds the site, and uploads the Pages artifact. A following step
  validates the generated Atom XML and every JSON-LD block using tools already
  available on the CI runner.
- `fetch-webmentions.yml` runs every 30 minutes or manually. It fetches the
  Webmention JSON into `static/webmention/webmentions.json` and commits changed
  generated data directly to `main`. This is intentional cache-data behavior,
  and the workflow shares the `site-publish` concurrency group.
- `send-webmentions.yml` runs after a successful production build, waits one
  minute, and uses the pinned `@remy/webmention@1.5.0` CI-only package to send
  outgoing Webmentions from the public Atom feed.
- `update-screenshot.yml` periodically captures the live homepage with Chrome
  and commits the screenshot only when it changes.

The workflows use pinned GitHub Actions. Keep CI-only tools out of the local
setup unless they become necessary for ordinary editing.

## Sass, UIkit, and JavaScript assets

`sass/style.scss` is the Sass entry point compiled by Zola. Files directly under
`sass/` are site-specific overrides and customizations. Files under
`sass/_vendor/` are the vendored UIkit Sass source used by the entry point.

UIkit JavaScript and icons are vendored under `static/scripts/_vendor/` and are
loaded by `templates/base.html`. The current JavaScript banner identifies UIkit
`3.25.21`. To update UIkit, obtain the matching upstream release, compare the
Sass and JavaScript changes, preserve the site's custom Sass files and theme
overrides, rebuild, and inspect the homepage, menus, theme picker, modals, and
post layouts. The old Sass archive has been removed because it was not imported
or referenced by the active build. Do not introduce a package-manager build step
just to update the vendored assets.

## Images and generated derivatives

Original fonts, images, work media, and other static assets live under
`static/` or alongside the relevant work content and are tracked when they are
source material. Zola-generated resized images live under
`static/processed_images/` and are ignored. Do not commit generated derivatives
unless the asset workflow is intentionally changed.

When changing an image, preserve useful intrinsic dimensions and meaningful alt
text in the template. Use Zola's image processing where an appropriately sized
derivative is needed.

## IndieWeb and Webmentions

The site currently publishes an Atom feed and includes h-card/microformat
markup. Webmention fetch and send workflows exist, but the fetched JSON is not
currently rendered by the templates. Treat changes to those workflows as
integration changes and verify both the feed and the public URLs after a
deployment.

The IndieAuth and receiving Webmention links in `templates/base.html` are
currently scaffolding. Enable them only after the corresponding service and
endpoints have been verified.
