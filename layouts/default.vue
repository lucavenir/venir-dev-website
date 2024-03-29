<script setup lang="ts">
const app = useNuxtApp();
const { activeHeadings, updateHeadings } = useScrollspy();

const links = computed(() => [{
  label: 'Home',
  icon: 'i-heroicons-home',
  to: '#home',
  active: activeHeadings.value.includes('home')
}, {
  label: 'Services',
  icon: 'i-heroicons-clog',
  to: '#services',
}, {
  label: 'Case History',
  icon: 'i-heroicons-map',
  to: '#history'
}, {
  label: 'About Me',
  icon: 'i-heroicons-person',
  to: '#about'
}, {
  label: 'Releases',
  icon: 'i-heroicons-mail',
  to: '#contact',
}]);
useHead({
  title: "Luca Venir | SW Engineer"
});
app.hooks.hookOnce('page:finish', () => {
  updateHeadings([
    document.querySelector('#home')!,
    document.querySelector('#services')!,
    document.querySelector('#history')!,
    document.querySelector('#about')!,
    document.querySelector('#contact')!,
  ])
});

const isDark = useDark()
const favicon = computed(() => isDark.value ? '/icon/favicon-light.ico' : '/icon/favicon-dark.ico')
useFavicon(favicon, { rel: 'icon' })
</script>

<template>
  <UHeader :links="links">
    <template #logo>
      <Logo class="w-auto max-h-28 my-12" />
    </template>

    <template #right>
      <UColorModeButton />
    </template>

    <template #panel>
      <UAsideLinks :links="links" />
    </template>
  </UHeader>

  <UMain>
    <slot />
  </UMain>

  <UFooter>
    <template #right>
      <UButton to="https://github.com/lucavenir" target="_blank" icon="i-heroicons-github" color="gray"
        variant="ghost" />
      <UButton to="https://www.linkedin.com/in/lucavenir/" target="_blank" icon="i-heroicons-linkedin" color="gray"
        variant="ghost" />
      <UButton to="https://x.com/venir_dev" target="_blank" icon="i-heroicons-x" color="gray" variant="ghost" />
    </template>
  </UFooter>
  <UNotifications />
</template>