<script setup lang="ts">
import type { ParsedContent } from "@nuxt/content/dist/runtime/types";
const { fullPath } = useRoute();
const contentPath = `${fullPath}`;


const { activeHeadings, updateHeadings } = useScrollspy();


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
  <pre v-if="!pending">
    {{ page }}
  </pre>
  <div v-if="page">
    <ULandingHero :description="page.home.description" :links="page.home.links">
      <template #title>
        <span id="home">{{ page.home.hi }}</span> <span class="text-yellowOrange-300">{{ page.home.name }}</span>
      </template>
    </ULandingHero>

    <ULandingSection :title="page.services.title" :description="page.services.description"
      :headline="page.services.headline">
      <UPageGrid id="services" class="scroll-mt-[calc(var(--header-height)+140px+128px+96px)]">
        <ULandingCard v-for="(item, index) in page.services.items" :key="index" v-bind="item" />
      </UPageGrid>
    </ULandingSection>

    <ULandingSection :headline="page.history.headline" :title="page.history.title"
      :description="page.history.description">
      <UPageColumns id="history" class="xl:columns-4 scroll-mt-[calc(var(--header-height)+140px+128px+96px)]">
        <div v-for="(testimonial, index) in page.history.items" :key="index" class="break-inside-avoid">
          <ULandingTestimonial v-bind="testimonial" />
        </div>
      </UPageColumns>
      <UIcon icon="i-heroicons-"></UIcon>
    </ULandingSection>

    <ULandingSection class="bg-primary-50 dark:bg-primary-400 dark:bg-opacity-10">
      <ULandingCTA id="contact" v-bind="page.contact" :card="false" />
    </ULandingSection>
  </div>
</template>