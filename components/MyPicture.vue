<script setup lang="ts">
defineProps({
  src: {
    type: String,
    required: true
  },
  alt: {
    type: String,
    required: true
  }
});
</script>

<template>
  <NuxtImg :src :alt format="webp" placeholder />
</template>