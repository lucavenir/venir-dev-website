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
  }
})
