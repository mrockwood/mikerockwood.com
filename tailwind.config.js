const colors = require('tailwindcss/colors')
const plugin = require('tailwindcss/plugin')

module.exports = {
	mode: 'jit',
	content: [
		'./src/**/*.njk',
		'./src/**/*.md',
		'./src/**/*.js',
		'./.*.js',
		'./public/**/*.html'
	],
	safelist: process.env.NODE_ENV === "development" ? [{ pattern: /.*/ }] : [], // include all classes while dev
	darkMode: 'media', // or 'media' or 'class'
	theme: {
		colors: {
			gray: colors.slate,
			purple: colors.purple,
			orange: colors.orange,
			rose: colors.rose,
			blue: colors.blue,
			green: colors.green,
			yellow: colors.yellow,
			white: colors.white,
			black: colors.black,
			current: 'currentColor',
			transparent: 'transparent'
		},
		fontFamily: {
			sans: [
				'Inter',
				'ui-sans-serif',
				'system-ui',
				'-apple-system',
				'BlinkMacSystemFont',
				'Segoe UI',
				'Roboto',
				'Helvetica Neue',
				'Arial',
				'Noto Sans',
				'sans-serif',
				'Apple Color Emoji',
				'Segoe UI Emoji',
				'Segoe UI Symbol',
				'Noto Color Emoji'
			],
			serif: [
				'ui-serif',
				'Georgia',
				'Cambria',
				'Times New Roman',
				'Times',
				'serif'
			]
		}
	},
	variants: {
		backgroundColor: ['responsive', 'dark', 'focus', 'active', 'hover'],
		extend: { space: ['last'] }
	},
	plugins: []
}
