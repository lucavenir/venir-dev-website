<script setup lang="ts">
const error = useError();
</script>

<template>
  <NuxtLayout>
    <div>
      <h1>oof</h1>
      <h2>{{ error?.statusCode }}</h2>
      <div>Looks like we failed this one</div>
      <code>{{ error?.message }}</code>
    </div>
  </NuxtLayout>
</template>
