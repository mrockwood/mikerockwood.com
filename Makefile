serve:
	zola serve --drafts --open

admin:
	open http://localhost:1111/admin/

build:
	zola build

check:
	zola check

push:
	git pull origin master; \
	git add --all; \
	git commit --m "automated push"; \
	git push origin master
