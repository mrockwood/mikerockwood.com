# Site TODO

Last reviewed: 2026-08-29

This is a practical roadmap for the current site. `[x]` means complete, `[~]`
means partly complete or verified manually, and `[ ]` means still outstanding.

## Current baseline

- Zola `0.23.2` is pinned in [`ZOLA_VERSION`](ZOLA_VERSION).
- `make check` and `make build` pass locally.
- The site has a shared Zola shell in `templates/base.html`, separate templates
  for several post types, a Sveltia CMS configuration, Atom feeds, microformats,
  and Webmention workflows.
- There is no automated HTML, feed, structured-data, accessibility, or browser
  test suite yet.

### Dependency boundary

- Local editing and local builds should require only Zola and Make.
- Sveltia should continue to work through its hosted web application without a
  local package-install step.
- CI/CD-only validators, browsers, and publishing tools are acceptable when they
  do not change the local editing workflow.
- Vendored frontend assets are preferred over adding a local JavaScript package
  toolchain.

## P0 — Keep publishing safe

### Add explicit CI checks

- [x] Run `zola check` as a named CI step before deployment.
- [x] Build the site once and fail the workflow if the build fails.
- [x] Validate generated Atom XML and JSON-LD in CI using isolated CI tooling;
  do not add those tools to the local setup.
- [x] Add an internal-link check when the current content and URL behavior are
  stable enough for it.

Done when a malformed template, feed, or structured-data block prevents a
deployment.

### Make automated writes predictable

- [x] Pin the Zola version and GitHub Actions used by deployment.
- [x] Use a shared `site-publish` concurrency group for publishing workflows.
- [x] Make the Webmention fetch fail on HTTP errors and avoid empty commits.
- [x] Pin or otherwise make the CI-only `npm`/`npx` dependency used by
  `send-webmentions.yml` reproducible.
- [x] Keep automated Webmention commits going directly to `main`; the fetched
  JSON is generated cache data rather than editorial content, and pull requests
  would add maintenance without useful review at the current scale.

## P1 — Simplify the template architecture

### Keep the intentional content registry

- [x] Keep `templates/base.html` responsible for document structure, shared
  metadata, header, footer, global UI, and the site content registry.
- [x] Keep the `get_section()` calls centralized so current and future post types
  are available consistently to descendant templates.
- [x] Document that empty post sections are intentional future publishing types.

Done when the centralized registry remains intentional, documented, and easy to
update when a post type is added or permanently retired.

### Create a shared post layout

- [ ] Build one shared shell for post title, date, author, content, taxonomies,
  related links, and footer metadata.
- [ ] Leave only genuinely type-specific markup in article, bookmark, jam, note,
  photo, video, and other post-type templates.
- [ ] Standardize standalone post templates on the same semantic `<main>` and
  metadata blocks.
- [ ] Remove obsolete commented-out layouts after the shared shell is working.

Done when common post behavior is implemented once.

### Centralize metadata

- [~] Shared title, description, image, canonical, Open Graph, and JSON-LD
  output lives in `templates/base.html`.
- [x] JSON-LD strings are JSON-encoded and the generated JSON is valid.
- [x] The generated Atom feed is well-formed XML and its text/URL values are
  explicitly XML-escaped.
- [ ] Choose accurate Open Graph types for articles, work, profiles, and the
  generic site shell.
- [ ] Add automated checks for canonical URLs, descriptions, and structured data.

## P1 — Define the IndieWeb features actually supported

- [ ] Decide which features are intentionally supported: h-card, h-entry,
  Webmention receiving, Webmention sending, IndieAuth, syndication, and feeds.
- [ ] Reuse one canonical author h-card instead of maintaining both an inline
  version and a partial unless both have a deliberate purpose.
- [ ] Add and verify `u-url`, `u-uid`, `p-author`, `dt-published`, and `e-content`
  on the post types that publish standalone pages.
- [ ] Decide whether the currently commented-out IndieAuth and Webmention links
  should be enabled or removed.
- [ ] Validate the Webmention JSON shape before rendering it.
- [ ] Render received Webmentions on the relevant post pages, or document that
  receiving is not currently supported.
- [ ] Ensure the sending workflow uses a pinned, reproducible dependency.

Done when the README can accurately describe the site's IndieWeb behavior and a
microformats/Webmention test can verify it.

## P1 — Make the CMS match the content model

- [x] Active collections have required dates, taxonomies, type-specific fields,
  URL widgets, and select options where appropriate.
- [x] Audit every CMS collection against the templates and front matter actually
  in use, especially the empty post sections for photos, videos, reposts, RSVPs,
  and likes.
- [x] Add or remove collections for post types deliberately; do not expose an
  editor for a type that has no supported rendering path.
- [x] Add content templates for the post types that remain active.
- [x] Document CMS authentication, permissions, branch behavior, and how an edit
  reaches production.

Done when a new post can be created in Sveltia without studying the templates,
and every exposed field has a known rendering path.

## P2 — Reduce maintenance cost

### Assets and UIkit

- [x] Document which Sass files are upstream UIkit and which are site-specific.
- [x] Decide whether the `sass/_archive/` copy is still needed and remove the
  unused archive.
- [x] Document the UIkit version and the procedure for updating it.
- [x] Separate original media from generated derivatives and decide which belong
  in Git.
- [x] Check the largest pages for unnecessarily large images and missing image
  dimensions or useful alt text.

### Cleanup and documentation

- [x] Remove stale Nunjucks references.
- [x] Remove the known orphaned templates.
- [x] Remove unused components, dead configuration fields, and transitional
  commented-out code.
- [x] Remove accidental repository artifacts such as `.DS_Store` files.
- [x] Move important architectural decisions out of long-lived template comments
  and into the README or maintenance documentation.
- [x] Add a short architecture section to the README describing the render path:
  content section → section/page template → shared layout → generated output.

## Suggested next sequence

1. Add explicit CI checks for `zola check`, the build, Atom XML, and JSON-LD.
2. Decide which IndieWeb features are real and finish or remove their scaffolding.
3. Move section queries out of `base.html` and consolidate the post shell.
4. Clean up any remaining dead asset or template code.
