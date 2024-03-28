<script setup lang="ts">
const colorMode = useColorMode();
const logo = computed(
  () => colorMode.value == 'dark'
    ? '/img/venir-dev-icon-light.png'
    : '/img/venir-dev-icon-dark.png'
);
console.log(logo.value);
</script>

<template>
  <img :src="logo" alt="venir.dev" />
</template>
