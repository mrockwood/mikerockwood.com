ZOLA ?= zola
ZOLA_VERSION ?= 0.23.2

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
	$(ZOLA) serve --drafts --open

build: doctor
	$(ZOLA) build

check: doctor
	$(ZOLA) check