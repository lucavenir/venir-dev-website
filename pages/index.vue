<script setup lang="ts">
import type { ParsedContent } from "@nuxt/content/dist/runtime/types";
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
  <div id="home" v-if="page">
    <ULandingHero :description="page.home.description" :links="page.home.links" orientation="horizontal">
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
  </div>
</template>