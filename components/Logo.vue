<script setup lang="ts">
const colorMode = useColorMode();
const logo = computed(
  () => colorMode.value == 'dark'
    ? '/logo/venir-dev-logo-light.png'
    : '/logo/venir-dev-logo-dark.png'
);
</script>

<template>
  <img :src="logo" alt="venir.dev" />
</template>
