# Site architecture TODO

This roadmap is ordered by architectural impact. Each task has a completion criterion so it can be used as an implementation plan.

## P0 — Reliable foundation

### Pin the build toolchain

- [x] Pin the Zola version locally and in CI.
- [x] Replace the deployment action's `@master` reference with a pinned release or commit.
- [x] Make every Makefile target use the same configurable Zola command.
- [x] Document the supported local setup and build commands.

Progress: local and CI builds now target Zola `0.23.2`. The CI build action is pinned to a specific commit.

Done when a clean checkout builds on a new machine and local and CI builds use the same Zola version.

### Make deployment safe and deterministic

- [x] Remove or redesign `make push` so it cannot automatically commit and push arbitrary changes.
- [x] Make deployment fail clearly when the build fails.
- [x] Pin third-party GitHub Actions.
- [x] Prevent automated Webmention updates from racing with content deployments.

Done when only successfully built output is published and automated jobs cannot overwrite or rebase over content work.

### Define the publishing data model

- [ ] Document common fields required by every post: title, date, summary, type, content, taxonomy, canonical URL, and author.
- [ ] Normalize type-specific fields such as `bookmarkOf`, `like-of`, `repost-of`, `in-reply-to`, media IDs, and thumbnails.
- [ ] Choose one naming convention for front matter keys.
- [ ] Add validation for required fields and valid values per post type.

Done when a new post can be created from a documented template and invalid content fails during checking.

## P1 — Consolidate templates and post rendering

### Create a shared post layout

- [ ] Build one shared post shell for title, date, author, content, taxonomies, related links, and footer metadata.
- [ ] Move only genuinely type-specific markup into small components.
- [ ] Standardize template inheritance so post templates override the same block.
- [ ] Remove duplicated commented-out layouts once the shared shell works.

Done when common post behavior is implemented once and shared features do not require editing every post-type template.

### Separate post type from visual presentation

- [ ] Represent post type as data rather than relying entirely on directory-specific templates.
- [ ] Define which types have standalone pages, feeds, archive pages, or only appear in the unified stream.
- [ ] Consolidate or remove types that are no longer actively used.

Done when adding a post type requires a small configuration change rather than another family of duplicated templates.

### Centralize page metadata

- [ ] Create one metadata component for title, description, image, canonical URL, publication date, and content type.
- [ ] Generate appropriate Open Graph types for articles, profiles, work, and generic pages.
- [ ] Fix and validate the JSON-LD output.
- [ ] Add automated checks for canonical URLs, descriptions, and structured data.

Done when every important page has valid title, description, canonical, Open Graph, and structured-data output.

## P1 — Finish the IndieWeb implementation

### Define the IndieWeb contract

- [ ] Decide which features are supported: h-card, h-entry, Webmention receiving, Webmention sending, IndieAuth, syndication, and feeds.
- [ ] Document required microformats properties for every post type.
- [ ] Identify the canonical author h-card and reuse it consistently.
- [ ] Add stable `u-url`, `u-uid`, `p-author`, `dt-published`, and `e-content` properties where appropriate.

Done when a microformats parser can identify the author, canonical URL, date, content, and relationship target for every published post.

### Connect Webmentions end to end

- [ ] Enable and verify the `rel="webmention"` endpoint link.
- [ ] Confirm the receiver is configured for the correct domain and endpoint.
- [ ] Define and validate the fetched Webmention JSON schema.
- [ ] Render likes, replies, reposts, bookmarks, and other mentions on relevant post pages.
- [ ] Make the fetch workflow fail on HTTP errors or invalid JSON.
- [ ] Ensure empty or malformed Webmention data cannot break the build.

Done when a test Webmention can be received, fetched, rendered, and deployed without manual intervention.

### Decide whether to implement IndieAuth

- [ ] Either implement and test the IndieAuth endpoints or remove the inactive scaffolding.
- [ ] Document the identity provider and authorization flow if enabled.

Done when IndieAuth is either functional and tested or no longer presented as part of the site's architecture.

## P1 — Maintainable assets and frontend dependencies

### Establish an asset pipeline

- [ ] Separate original/source media from generated derivatives and test fixtures.
- [ ] Decide which generated files belong in Git and which are produced during builds.
- [ ] Audit duplicate images and remove obsolete variants.
- [ ] Use consistent responsive image sizes, formats, dimensions, and lazy-loading behavior.
- [ ] Measure the largest pages and set practical size budgets.

Done when the repository has a documented source/generated boundary and production pages do not ship unnecessarily large originals.

### Document and version the UIkit customization

- [ ] Record the UIkit version and upstream source.
- [ ] Identify upstream Sass/JavaScript versus site-specific code.
- [ ] Keep custom theme overrides in a separate layer.
- [ ] Remove unused UIkit modules from the production bundle where practical.
- [ ] Document a repeatable dependency update procedure.

Done when a future UIkit update has a known upgrade path and custom styles are distinguishable from framework code.

## P2 — Content operations and quality

### Make CMS and Git workflows explicit

- [ ] Document Sveltia CMS authentication, permissions, and branch behavior.
- [ ] Decide whether CMS edits and automated Webmention updates use direct commits, branches, or pull requests.
- [ ] Add a preview workflow for content changes.
- [ ] Add content templates for every supported post type.

Done when publishing, previewing, and automated updates cannot conflict and contributors can create valid content without studying templates.

### Add quality checks

- [ ] Run `zola check` in CI.
- [ ] Add internal-link checking and distinguish it from external-link availability checks.
- [ ] Validate generated HTML, JSON-LD, and microformats in CI.
- [ ] Add accessibility checks for headings, landmarks, labels, alt text, and keyboard interaction.
- [ ] Add browser smoke tests for the homepage, posts, work pages, theme switcher, and mobile menu.

Done when template regressions fail CI before deployment and core journeys are tested with and without JavaScript where appropriate.

### Remove transitional code

- [x] Remove stale Nunjucks references.
- [ ] Remove commented-out includes, unused components, and duplicate layouts.
- [x] Remove orphaned templates.
- [ ] Remove dead configuration fields.
- [ ] Remove `.DS_Store` and other accidental repository artifacts.
- [ ] Record current architectural decisions in project documentation rather than abandoned template comments.

Done when every template and workflow has a current purpose and a new maintainer can follow the rendering path.

## Suggested sequence

1. Pin Zola and make CI reproducible.
2. Define and validate the common content model.
3. Consolidate shared post and metadata templates.
4. Finish or explicitly narrow the IndieWeb implementation.
5. Clarify UIkit and asset boundaries.
6. Add automated quality checks and remove transitional code.
