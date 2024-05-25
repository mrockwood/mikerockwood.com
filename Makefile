# Detect the operating system
OS := $(shell uname)

# Default zola command
ZOLA_CMD = zola

# Adjust the zola command for Linux with flatpak
ifeq ($(OS), Linux)
    ZOLA_CMD = flatpak run org.getzola.zola
endif

# Define targets using the adjusted zola command
start:
	$(ZOLA_CMD) serve --drafts --open

serve:
	$(ZOLA_CMD) serve --drafts --open


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
