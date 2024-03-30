<script setup lang="ts">
import type { ParsedContent } from "@nuxt/content/dist/runtime/types";

const app = useNuxtApp();
const { activeHeadings, updateHeadings } = useScrollspy();
watchEffect(() => {
  console.log(activeHeadings.value)
});
watchArray(activeHeadings, (newList, oldList, added, removed) => {
  console.log(newList)
})
const path = useLocalePath();

const sections = computed(() => {
  return [{
    label: 'Home',
    to: '#home',
    active:activeHeadings.value.includes('home')
  }, {
    label: 'Services',
    to: '#services',
    active: activeHeadings.value.includes('services')
  }, {
    label: 'Case History',
    to: '#history',
    active: activeHeadings.value.includes('history') 
  }, {
    label: 'About Me',
    to: '#about',
    active: activeHeadings.value.includes('about') 
  }, {
    label: 'Contact',
    to: '#contact',
    active: activeHeadings.value.includes('contact')
  }];
});
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


const { fullPath } = useRoute();
const contentPath = `${fullPath}`;

const { data: page, pending, error } = await useAsyncData<ParsedContent, Error>(
  contentPath,
  () => queryContent('').findOne()
);
useSeoMeta({
  title: page.value?.title,
  ogTitle: page.value?.title,
  description: page.value?.description,
  ogDescription: page.value?.description
})
</script>

<template>
  <UHeader :links="sections">
    <template #logo :to="path('/#home')">
      <Logo class="w-auto max-h-28 my-12" />
    </template>
    <template #panel>
      <UAsideLinks :links="sections" />
    </template>
    <template #right>
      <UColorModeButton />
    </template>
  </UHeader>

  <UMain v-if="page">
    <ULandingHero id="home" :description="page.home.description" :links="page.home.links" orientation="horizontal">
      <template #title>
        <span>{{ page.home.hi }}</span> <span class="text-yellowOrange-300">{{ page.home.name }}</span>.
      </template>
      <template #default>
        <MyPicture src="/img/mountain.png" alt="a happy family chilling on a trail"
          class="w-full rounded-3xl shadow-full ring-1 ring-gray-300 dark:ring-gray-700" />
      </template>
    </ULandingHero>

    <ULandingSection id="services" :title="page.services.title" :description="page.services.description"
      :headline="page.services.headline">
      <UPageGrid class="scroll-mt-[calc(var(--header-height)+140px+128px+96px)]">
        <ULandingCard v-for="(item, index) in page.services.items" :key="index" v-bind="item" />
      </UPageGrid>
    </ULandingSection>

    <ULandingSection id="history" :headline="page.history.headline" :title="page.history.title"
      :description="page.history.description">
      <UPageGrid>
        <UPageCard v-for="client in page.history.clients" :key="client.id" :title="client.name" :icon="client.icon"
          :description="client.description" :to="client.link" target="_blank" orientation="horizontal">
        </UPageCard>
      </UPageGrid>
    </ULandingSection>

    <ULandingSection id="about" :headline="page.about.headline" :title="page.about.title"
      :description="page.about.description" align="right">
      <template #links>
        <ULandingCard orientation="horizontal" v-for="(item, index) in page.about.skills" :key="index" :icon=item.icon
          :title="item.title" :description="item.status" />
      </template>
      <MyPicture src="/img/beach.png" alt="a happy family chilling on the beach"
        class="w-full rounded-3xl shadow-full ring-1 ring-gray-300 dark:ring-gray-700" />
    </ULandingSection>

    <ULandingSection id="contact" class="bg-primary-50 dark:bg-primary-400 dark:bg-opacity-10">
      <ULandingCTA :title="page.contact.title" :description="page.contact.description" :card="false">
        <template #links>
          <UButton v-for="link in page.contact.links" :to="link.url" target="_blank" size="xl" :variant="link.variant">
            {{ link.label }}
          </UButton>
        </template>
      </ULandingCTA>
    </ULandingSection>
  </UMain>

  <UFooter :links="[{ label: 'more on wde.it', to: 'https://wde.it' }]">
    <template #right>
      <UButton to="https://github.com/lucavenir" target="_blank" icon="i-fa6-brands-github" color="gray"
        variant="ghost" />
      <UButton to="https://www.linkedin.com/in/lucavenir/" target="_blank" icon="i-fa6-brands-linkedin" color="gray"
        variant="ghost" />
      <UButton to="https://x.com/venir_dev" target="_blank" icon="i-fa6-brands-x-twitter" color="gray"
        variant="ghost" />
    </template>
  </UFooter>
  <UNotifications />
</template>