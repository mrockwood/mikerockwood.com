ZOLA ?= zola
ZOLA_VERSION_FILE ?= ZOLA_VERSION
ZOLA_VERSION ?= $(strip $(shell cat "$(ZOLA_VERSION_FILE)"))

.PHONY: serve build check doctor

doctor:
	@command -v "$(ZOLA)" >/dev/null || \
		{ echo "Zola not found. Install Zola $(ZOLA_VERSION), or run with ZOLA=/path/to/zola"; exit 1; }
	@actual=$$($(ZOLA) --version | awk '{print $$2}'); \
	if [ "$$actual" != "$(ZOLA_VERSION)" ]; then \
		echo "Expected Zola $(ZOLA_VERSION), found $$actual"; \
		exit 1; \
	fi

serve: doctor
	$(ZOLA) serve --drafts --open --base-url 127.0.0.1

build: doctor
	$(ZOLA) build

check: doctor
	$(ZOLA) check
