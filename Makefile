serve:
	zola serve --drafts

build:
	zola build

push:
	git pull origin master; \
	git add --all; \
	git commit --m "automated push"; \
	git push origin master
