export default defineNuxtConfig({
  app: {
    head: { link: [{ rel: 'icon', type: 'image/png', href: '/icon/favicon-dark.ico' }] },
  },
  devtools: { enabled: true },
  extends: ['@nuxt/ui-pro'],
  modules: [
    '@nuxt/content',
    '@nuxt/ui',
    '@nuxt/fonts',
    '@nuxtjs/i18n',
    '@pinia/nuxt',
    '@vueuse/nuxt',
    '@nuxt/image',
  ],
  ui: {
    icons: ['ph', 'simple-icons']
  },
  colorMode: {
    preference: 'dark'
  },
  content: {
    defaultLocale: 'en',
    locales: ['en', 'it'],
  },
  i18n: {
    strategy: 'prefix',
    defaultLocale: 'en',
    baseUrl: process.env.BASE_URL || 'https://localhost:3000',
    detectBrowserLanguage: {
      useCookie: true,
      cookieKey: 'i18n_redirected',
      redirectOn: 'root',
    },
    locales: [
      { code: 'en', iso: 'en-US' },
      { code: 'fr', iso: 'fr-FR' },
    ]
  },
});
