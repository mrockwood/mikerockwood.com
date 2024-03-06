UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    ZOLA := flatpak run org.getzola.zola
endif
ifeq ($(UNAME_S),Darwin)
    ZOLA := zola  # Replace with the actual path on macOS
endif

ZOLA_COMMAND := $(ZOLA) serve --drafts --open

serve:
	$(ZOLA_COMMAND)

start:
	$(ZOLA_COMMAND)

admin:
	open http://localhost:1111/admin/

build:
	$(ZOLA) build

check:
	$(ZOLA) check

push:
	git pull origin master; \
	git add --all; \
	git commit --m "automated push"; \
	git push origin master
