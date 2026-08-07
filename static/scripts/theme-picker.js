(() => {
    const THEME_STORAGE_KEY = 'theme'
    const DEFAULT_THEME = 'uk-theme-auto'
    const THEME_BUTTON_SELECTOR = '.uk-theme-button[data-theme]'
    const ACTIVE_CLASS = 'uk-active'

    const root = document.documentElement
    const themeButtons = Array.from(
        document.querySelectorAll(THEME_BUTTON_SELECTOR)
    )
    const availableThemes = new Set(
        themeButtons.map((button) => button.dataset.theme)
    )
    const supportsCustomProperties = window.CSS?.supports(
        'color',
        'var(--fake-var)'
    )

    if (!themeButtons.length || !supportsCustomProperties) {
        return
    }

    const getStoredTheme = () => {
        try {
            return localStorage.getItem(THEME_STORAGE_KEY)
        } catch {
            return null
        }
    }

    const storeTheme = (theme) => {
        try {
            localStorage.setItem(THEME_STORAGE_KEY, theme)
        } catch {
            // Theme selection still works when storage is unavailable.
        }
    }

    const updateSelectedButton = (theme) => {
        themeButtons.forEach((button) => {
            const isSelected = button.dataset.theme === theme
            const item = button.closest('li')

            item?.classList.toggle(ACTIVE_CLASS, isSelected)
            button.setAttribute('aria-pressed', String(isSelected))
        })
    }

    const applyTheme = (theme, { persist = true } = {}) => {
        const nextTheme = availableThemes.has(theme) ? theme : DEFAULT_THEME

        root.dataset.theme = nextTheme
        updateSelectedButton(nextTheme)

        if (persist) {
            storeTheme(nextTheme)
        }
    }

    const storedTheme = getStoredTheme()
    applyTheme(storedTheme, { persist: false })

    themeButtons.forEach((button) => {
        button.addEventListener('click', () => {
            applyTheme(button.dataset.theme)
        })
    })
})()
