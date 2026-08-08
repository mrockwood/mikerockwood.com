#!/bin/sh
set -eu

test -f public/index.html
grep -q '<link rel="canonical"' public/index.html
grep -q '<meta name="description"' public/index.html
grep -q 'application/ld+json' public/index.html
grep -q '"@context": "https://schema.org"' public/index.html
grep -q 'rel="webmention"' public/index.html

find public -path "public/admin" -prune -o -type f -name "*.html" -exec sh -c '
	for file do
		grep -q "<html" "$file" || continue
		grep -q "<link rel=\"canonical\"" "$file" || { echo "Missing canonical URL: $file" >&2; exit 1; }
		grep -q "<meta name=\"description\"" "$file" || { echo "Missing description: $file" >&2; exit 1; }
		grep -q "application/ld+json" "$file" || { echo "Missing JSON-LD: $file" >&2; exit 1; }
		size=$(wc -c < "$file")
		[ "$size" -le 65536 ] || { echo "HTML page exceeds 64 KiB: $file" >&2; exit 1; }
	done
' sh {} +

post_page=$(grep -l 'class="h-entry' $(find public/posts -type f -name index.html) | head -n 1)
test -n "$post_page"
grep -q 'class="h-entry' "$post_page"
grep -q 'class="u-url u-uid"' "$post_page"
grep -q 'class="p-author h-card"' "$post_page"
grep -q 'class="dt-published"' "$post_page"

for template in templates/posts/*/single.html; do
	grep -q '{% extends "posts/single.html" %}' "$template" || {
		echo "Post template does not use the shared shell: $template" >&2
		exit 1
	}
done

echo "Generated site checks passed"
